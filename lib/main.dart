import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:random_people_fluttering/theme.dart';

import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger('green'),
        child: MaterialAppWithTheme(),
      );
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeChanger = Provider.of<ThemeChanger>(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));

    // if (_themeChanger.getThemeMode() == 'green') {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.white,
    //     statusBarBrightness: Brightness.dark,
    //   ));
    // } else {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.black,
    //     statusBarBrightness: Brightness.light,
    //   ));
    // }

    return MaterialApp(
      title: 'Random People Fluttering',
      debugShowCheckedModeBanner: false,

      /// Routes
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomeScreen(),
      },

      /// App Theme
      theme: _themeChanger.getThemeData(),
    );
  }
}
