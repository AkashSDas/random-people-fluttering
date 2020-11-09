import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  getTheme() => this._themeData;

  setTheme(ThemeData themeData) {
    this._themeData = themeData;
    notifyListeners();
  }
}
