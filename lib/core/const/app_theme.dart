import 'package:flutter/material.dart';
import 'package:gharoghari/core/const/app_colors.dart';
import 'package:gharoghari/core/const/app_settings.dart';

class AppDefTheme {
  static ThemeData themeData = ThemeData(
    fontFamily: AppSettings.kAppFont,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        titleSpacing: 5,
        titleTextStyle: TextStyle(
            color: AppColor.kPrimaryBlue,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: AppSettings.kAppFont)),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: AppColor.kPrimaryBlue)),
  );
}
