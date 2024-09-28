import 'package:flutter/material.dart';

enum AppTextStyle {
  bodySmall,
  bodyNormal,
  buttonText,
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  caption,
  overline,
}

class AppTextStyles {
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle bodyNormal = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle headline1 = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300, // FontWeight.light -> w300 for consistency
    letterSpacing: -1.5,
    color: Colors.black,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: Colors.black,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
    color: Colors.black,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500, // FontWeight.medium -> w500
    letterSpacing: 0.15,
    color: Colors.black,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.15,
    color: Colors.black,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500, // FontWeight.medium -> w500
    letterSpacing: 0.1,
    color: Colors.black,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    color: Colors.black,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
    color: Colors.black,
  );

  static TextStyle getStyle(AppTextStyle style) {
    switch (style) {
      case AppTextStyle.bodySmall:
        return bodySmall;
      case AppTextStyle.bodyNormal:
        return bodyNormal;
      case AppTextStyle.buttonText:
        return buttonText;
      case AppTextStyle.headline1:
        return headline1;
      case AppTextStyle.headline2:
        return headline2;
      case AppTextStyle.headline3:
        return headline3;
      case AppTextStyle.headline4:
        return headline4;
      case AppTextStyle.headline5:
        return headline5;
      case AppTextStyle.headline6:
        return headline6;
      case AppTextStyle.subtitle1:
        return subtitle1;
      case AppTextStyle.subtitle2:
        return subtitle2;
      case AppTextStyle.caption:
        return caption;
      case AppTextStyle.overline:
        return overline;
    }
  }
}
