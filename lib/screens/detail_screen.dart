import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constant.dart';

class DetailScreen extends StatelessWidget {
  final int id;
  final String username;
  final String userImg;
  final String location;
  final String email;
  final int age;
  final String phoneNum;

  DetailScreen({
    Key key,
    this.id,
    this.username,
    this.userImg,
    this.location,
    this.email,
    this.age,
    this.phoneNum,
  }) : super(key: key);

  // AppBar
  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: space * 3,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        IconButton(
          icon: Icon(
            FontAwesome.star,
            size: space * 3,
            color: Colors.yellow,
          ),
          onPressed: () => print('Star btn clicked'),
        ),
      ],
    );
  }

  // User Hero Img
  Widget _buildUserImg(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'user_img${this.id}',
          child: Container(
            child: Image(
              image: NetworkImage(this.userImg),
              height: space * 40,
              width: space * 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
        _buildAppBar(context),
      ],
    );
  }

  Widget _buildUsername(String username, BuildContext context) {
    return Container(
      width: space * 40,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(0, -space * 5, 0),
          decoration: BoxDecoration(
            color: orange,
            borderRadius: BorderRadius.circular(space),
          ),
          width: space * 30,
          height: space * 8,
          child: Center(
            child: Text(
              username,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIndividualInfo(
    IconData iconData,
    Color iconColor,
    String text,
    BuildContext context,
  ) {
    return Row(
      children: [
        Icon(iconData, color: iconColor),
        SizedBox(width: space * 1.5),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: space * 4,
      thickness: space * 0.05,
      color: Theme.of(context).primaryColor,
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: space * 1.5,
        vertical: space,
      ),
      margin: EdgeInsets.symmetric(
        vertical: space * 0.0,
        horizontal: space * 0.4,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(space * 0.5),
      ),
      transform: Matrix4.translationValues(0, -space * 2, 0),
      child: Column(
        children: [
          _buildIndividualInfo(
            FontAwesome.address_card,
            cyan,
            this.location,
            context,
          ),
          _buildDivider(context),
          _buildIndividualInfo(
            FontAwesome.envelope,
            orange,
            this.email,
            context,
          ),
          _buildDivider(context),
          _buildIndividualInfo(
            FontAwesome.birthday_cake,
            pink,
            '${this.age.toString()} years old',
            context,
          ),
          _buildDivider(context),
          _buildIndividualInfo(
            FontAwesome.phone,
            green,
            this.phoneNum,
            context,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: [
          _buildUserImg(context),
          _buildUsername(this.username, context),
          _buildUserInfo(context),
        ],
      ),
    );
  }
}
