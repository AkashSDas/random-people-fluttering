import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:random_people_fluttering/theme.dart';

import '../../constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar({this.title});

  /// AppBar
  @override
  Widget build(BuildContext context) => AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
          size: space * 30,
        ),
        backgroundColor: Theme.of(context).accentColor,
        actions: [this._buildThemeIconButton(context)],
        title: Text(
          this.title,
          style: Theme.of(context).textTheme.headline1.copyWith(
            shadows: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              ),
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(-2, -2),
              )
            ],
          ),
        ),
      );

  /// Icon Button as the action btn of the AppBar
  /// Used for changing the theme of the app
  Widget _buildThemeIconButton(BuildContext context) {
    final ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    Icon themeIcon = Icon(
      FontAwesomeIcons.sun,
      size: space * 3,
      color: Theme.of(context).iconTheme.color,
    );

    /// Change theme
    if (_themeChanger.getThemeMode() == 'green') {
      themeIcon = Icon(
        FontAwesomeIcons.moon,
        size: space * 3,
        color: Theme.of(context).iconTheme.color,
      );
    } else if (_themeChanger.getThemeMode() == 'purple') {
      themeIcon = Icon(
        FontAwesomeIcons.sun,
        size: space * 3,
        color: Theme.of(context).iconTheme.color,
      );
    }

    return IconButton(
      onPressed: () => _themeChanger.toggleTheme(),
      icon: themeIcon,
      iconSize: space,
    );
  }
}
