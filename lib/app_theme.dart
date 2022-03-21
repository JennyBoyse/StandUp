import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  //primary colours
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF6B6B6B); // e.g. menu bar
  static const Color darkGrey = Color(0xFF382D2D); // e.g. menu bar
  static const Color blue = Color(0xFF00ACFF); // logo blue

  //secondary colours
  static const Color offWhite = Color(0xFFE5E5E5); // page background
  static const Color lightPurple = Color(0xFF4D2AB2); // light gradient colour
  static const Color darkPurple = Color(0xFF361265); // dark gradient colour
  static const Color pink = Color(0xFFFF007A);

  //tertiary colours
  static const Color lightGrey = Color(0xFFE0E0E0); // e.g. filter buttons
  static const Color lightBlue = Color(0xFFBFEAFF);
  static const Color darkBlue = Color(0xFF0071A8);
  static const Color purple = Color(0xFF7B61FF);
  static const Color purple2 = Color(0xFF6b4efc);

  static const String fontName = 'Ubuntu';

  static const TextTheme textTheme = TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title,
    subtitle2: subtitle,
    bodyText2: body2,
    bodyText1: body1,
  );

  static const TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: black,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: black,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: black,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: black,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    letterSpacing: 0.27,
    color: darkBlue,
  );

  static const TextStyle subtitle3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.27,
    color: black,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: black,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.2,
    color: black,
  );

  static const TextStyle body3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.2,
    color: black,
  );

  static const TextStyle card1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0,
    color: black,
  );

  static const TextStyle card2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.05,
    color: darkGrey,
  );

  static const TextStyle card3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle card4 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle card5 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle card6 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: white,
  );

  static const TextStyle card7 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    letterSpacing: 0.18,
    color: purple,
  );

  static const TextStyle card8 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 30,
    letterSpacing: -0.05,
    color: white,
  );

  static const HOMEPAGE = 0;
  static const ACTIVITYSCREEN = 1;
  static const STATISTICSSCREEN = 2;
  static const TIPSSCREEN = 3;
  static const SETTINGSSCREEN = 4;
}