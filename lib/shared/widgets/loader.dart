import 'package:flutter/material.dart';

import '../../constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.all(space),
        width: space * 10,
        height: space * 10,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: space * 10,
            height: space * 10,
            child: CircularProgressIndicator(strokeWidth: 8),
          ),
        ),
      );
}
