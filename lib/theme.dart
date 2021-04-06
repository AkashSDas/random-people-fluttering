import 'package:flutter/material.dart';
import 'package:random_people_fluttering/constants.dart';

class ThemeChanger extends ChangeNotifier {
  final greenThemeMode = {'mode': 'green', 'themeData': greenThemeData};
  final purpleThemeMode = {'mode': 'purple', 'themeData': purpleThemeData};

  /// Selecting theme
  Map<String, dynamic> themeDataInfo;

  ThemeChanger(String themeMode) {
    if (themeMode == 'green') {
      this.themeDataInfo = greenThemeMode;
    } else if (themeMode == 'purple') {
      this.themeDataInfo = purpleThemeMode;
    }
  }

  /// Get ThemeData for the current theme
  ThemeData getThemeData() => this.themeDataInfo['themeData'];

  /// Get the theme mode name
  String getThemeMode() => this.themeDataInfo['mode'];

  /// THEME SETTERS

  /// Change theme to green
  void setGreenTheme() {
    this.themeDataInfo = greenThemeMode;
    notifyListeners();
  }

  /// Change theme to purple
  void setPurpleTheme() {
    this.themeDataInfo = purpleThemeMode;
    notifyListeners();
  }

  /// Toggle theme
  void toggleTheme() {
    if (this.themeDataInfo['mode'] == 'green') {
      this.themeDataInfo = purpleThemeMode;
    } else if (this.themeDataInfo['mode'] == 'purple') {
      this.themeDataInfo = greenThemeMode;
    }

    notifyListeners();
  }
}
