import 'package:flutter/material.dart';
import 'package:random_people_fluttering/constants.dart';
import 'package:random_people_fluttering/shared/widgets/widgets.dart';

class InfoScreen extends StatelessWidget {
  final int id;
  final String username;
  final String userImg;
  final String location;
  final String email;
  final int age;
  final String phoneNumber;

  InfoScreen({
    this.id,
    this.username,
    this.userImg,
    this.location,
    this.email,
    this.age,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      /// Wrapping AppBar with PreferredSize to increase the height of the AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(title: 'Info'),
      ),

      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserThumbnail(context: context),
              SizedBox(height: space * 2),
              Text(
                username,
                style: Theme.of(context).textTheme.headline1.copyWith(
                      color: Theme.of(context).accentColor,
                    ),
              ),
              SizedBox(height: space * 2),
              Text(
                '$username is of age $age lives in $location. $username email address is $email and phone number is $phoneNumber',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Users thumbnail (their profile pic)
  Widget _buildUserThumbnail({BuildContext context}) => Hero(
        tag: 'user_img$id',
        child: Container(
          margin: EdgeInsets.all(space * 2),
          width: space * 20,
          height: space * 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor,
                blurRadius: 32.0,
                offset: Offset(0.0125, 0.0125),
              ),
              BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 32.0,
                offset: Offset(-0.0125, -0.0125),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(userImg),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
