import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Random People Fluttering',
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,

      // Route
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomeScreen(),
      },

      // Theme
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Color(0xFFDBE1E8),
        ),
        primaryColor: Color(0xFF12181B),
        accentColor: Color(0xFF2A2E35),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 40,
            color: Color(0xFFF8F8F8),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w800,
          ),
          headline2: TextStyle(
            fontSize: 22,
            color: Color(0xFFF8F8F8),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          headline3: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(
            fontSize: 26,
            color: Color(0xFFB2BECD),
            fontFamily: 'Lato',
          ),
          bodyText2: TextStyle(
            fontSize: 18,
            color: Color(0xFFB2BECD),
            fontFamily: 'Lato',
          ),
        ),
      ),
    );
  }
}
