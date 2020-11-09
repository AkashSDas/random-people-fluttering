import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:random_people_fluttering/constant.dart' as Constants;

class ThemeChanger extends ChangeNotifier {
  final lightThemeMode = {
    'mode': 'light',
    'themeData': Constants.lightThemeData,
  };

  final darkThemeMode = {
    'mode': 'dark',
    'themeData': Constants.darkThemeData,
  };

  Map<String, dynamic> themeDataInfo;

  ThemeChanger(String themeMode) {
    if (themeMode == 'light') {
      this.themeDataInfo = lightThemeMode;
    } else if (themeMode == 'dark') {
      this.themeDataInfo = darkThemeMode;
    }
  }

  getThemeData() {
    return this.themeDataInfo['themeData'];
  }

  getThemeMode() {
    return this.themeDataInfo['mode'];
  }

  setDarkTheme() {
    this.themeDataInfo = darkThemeMode;
    notifyListeners();
  }

  setLightTheme() {
    this.themeDataInfo = lightThemeMode;
    notifyListeners();
  }

  toggleTheme() {
    if (this.themeDataInfo['mode'] == 'light') {
      this.themeDataInfo = darkThemeMode;
    } else if (this.themeDataInfo['mode'] == 'dark') {
      this.themeDataInfo = lightThemeMode;
    }
    notifyListeners();
  }
}
