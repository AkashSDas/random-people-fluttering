import 'package:flutter/material.dart';

/// For paddings and margins
final double space = 10;

/// Colors
Color green1 = Color(0xff55DD94);
Color green2 = Color(0xff00C09E);
Color green3 = Color(0xff2F4858);
Color white1 = Colors.white;
Color white2 = Colors.white70;
Color black1 = Color(0xFF464646);
Color black2 = Colors.black;
Color yellow1 = Color(0xffFEFEDF);
Color purple1 = Color(0xffD7C9FF);
Color purple2 = Color(0xff6363E3);

/// Shadow
final shadow = BoxShadow(
  color: Colors.black12,
  blurRadius: 32.0,
  offset: Offset(0.0125, 0.0125),
);

/// TextTheme
TextTheme createTextTheme({
  Color headline1Color,
  Color headline2Color,
  Color headline3Color,
  Color headline4Color,
  Color bodyText1Color,
  Color bodyText2Color,
}) =>
    TextTheme(
      headline1: TextStyle(
        fontSize: 32,
        color: headline1Color,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        fontSize: 22,
        color: headline2Color,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        fontSize: 26,
        color: headline3Color,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        fontSize: 24,
        color: headline4Color,
        fontFamily: 'Prompt',
        fontWeight: FontWeight.w700,
      ),
      bodyText1: TextStyle(
        fontSize: 24,
        color: bodyText1Color,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w500,
      ),
      bodyText2: TextStyle(
        fontSize: 20,
        color: bodyText2Color,
        fontFamily: 'Jost',
        fontWeight: FontWeight.w500,
      ),
    );

/// Green theme
final greenThemeData = ThemeData(
  iconTheme: IconThemeData(color: green1),
  primaryColor: green1,
  accentColor: green3,
  textTheme: createTextTheme(
    headline1Color: green2,
    headline2Color: green2,
    headline3Color: white1,
    headline4Color: green3,
    bodyText1Color: black1,
    bodyText2Color: white2,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(green2),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: space * 0.7, horizontal: space * 1.5),
      ),
    ),
  ),
);

/// Purple theme
final purpleThemeData = ThemeData(
  iconTheme: IconThemeData(color: white1),
  primaryColor: purple1,
  accentColor: purple2,
  textTheme: createTextTheme(
    headline1Color: white1,
    headline2Color: black2,
    headline3Color: white1,
    headline4Color: black2,
    bodyText1Color: black2,
    bodyText2Color: white1,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(yellow1),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: space * 0.7, horizontal: space * 1.5),
      ),
    ),
  ),
);
