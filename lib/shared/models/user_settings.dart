import 'package:flutter/material.dart';

const TextStyle defaultStyle = TextStyle(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
  textBaseline: TextBaseline.alphabetic,
);

class UserSettings {
  TextAlign textAlignment;
  TextStyle textStyle;
  TextDirection textDirection;

  UserSettings({
    this.textAlignment = TextAlign.left,
    this.textStyle = defaultStyle,
    this.textDirection = TextDirection.ltr,
  });
}
