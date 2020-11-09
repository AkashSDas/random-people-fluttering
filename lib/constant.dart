import 'package:flutter/material.dart';

final double space = 10;

final cyan = Color(0xFF00F0FF);
final orange = Color(0xFFFFA800);
final pink = Color(0xFFFF00E5);
final green = Color(0xFF14FF00);

final shadow = BoxShadow(
  color: Colors.black,
  blurRadius: 20.0,
);

final innerShadow = BoxShadow(
  color: Colors.black,
  blurRadius: 40.0,
  offset: Offset(-10, -10),
);

final lightThemeData = ThemeData(
  iconTheme: IconThemeData(
    color: Color(0xFF464646),
  ),
  primaryColor: Color(0xFFF8F8F8),
  accentColor: Color(0xFFEFEFEF),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 40,
      color: Color(0xFF464646),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
      fontSize: 22,
      color: Color(0xFF464646),
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
      color: Color(0xFF464646),
      fontFamily: 'Lato',
    ),
    bodyText2: TextStyle(
      fontSize: 18,
      color: Color(0xFF464646),
      fontFamily: 'Lato',
    ),
  ),
);

final darkThemeData = ThemeData(
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
);
