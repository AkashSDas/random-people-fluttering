import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

import './screens.dart';
import '../constant.dart';
import '../shared/widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url = 'https://randomuser.me/api/?results=20';
  bool isLoading = true;
  List userData;

  // Getting the user data from api
  Future<void> getData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {'Accept': 'application/json'},
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      userData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  // AppBar
  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(MaterialCommunityIcons.menu, size: space * 3),
        Icon(WeatherIcons.wi_day_sunny, size: space * 3),
      ],
    );
  }

  // App info
  Widget _buildAppInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: space * 2),
        Text('Random', style: Theme.of(context).textTheme.headline1),
        Text('People', style: Theme.of(context).textTheme.headline1),
        Text('Fluttering', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: space * 2),
        Text(
          'Random user api used for generating random user data',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildUserThumbnail(String photoUrl, int id) {
    return Hero(
      tag: 'user_img$id',
      child: Container(
        padding: EdgeInsets.all(space),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(space),
        ),
        child: Image(
          image: NetworkImage(photoUrl),
          height: space * 6,
          width: space * 6,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _buildUserInfo(String username, String country) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: space * 20,
          child: Text(
            username,
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: space),
        Row(
          children: [
            Icon(FontAwesome.location_arrow),
            SizedBox(width: space),
            Container(
              child: Text(
                country,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserListView() {
    return Container(
      child: isLoading
          ? Loader()
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (context, index) {
                String userThumbnail = userData[index]['picture']['thumbnail'];
                String firstName = "${userData[index]['name']['first']}";
                String lastName = "${userData[index]['name']['last']}";
                String username = "$firstName $lastName";
                String city = "${userData[index]['location']['city']}";
                String state = "${userData[index]['location']['state']}";
                String country = "${userData[index]['location']['country']}";
                String location = "$city, $state, $country";
                String userLargeImg = "${userData[index]['picture']['large']}";
                String email = "${userData[index]['email']}";
                int age = userData[index]['dob']['age'];
                String phoneNum = "${userData[index]['phone']}";

                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          id: index,
                          username: username,
                          userImg: userLargeImg,
                          location: location,
                          email: email,
                          age: age,
                          phoneNum: phoneNum,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [shadow]),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildUserThumbnail(userThumbnail, index),
                          _buildUserInfo(username, country),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: space * 2,
          vertical: space * 2,
        ),
        children: [
          _buildAppBar(),
          SizedBox(height: space),
          _buildAppInfo(),
          Divider(
            height: space * 8,
            color: Theme.of(context).accentColor,
            thickness: 4,
          ),
          _buildUserListView(),
        ],
      ),
    );
  }
}
