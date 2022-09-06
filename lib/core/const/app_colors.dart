import 'package:flutter/material.dart';

class AppColor {
  static Color kDefaultFontColor = Colors.white;
  static const Color kPrimaryBlue = Color(0xff29567D);
  static const Color kPrimaryTextColor = Color(0xff4F7CA3);
  static const Color kSecondaryTextColor = Color(0xffF06077);
  static const Color kPinkTextColor = Color(0xffFF9F9E);
  static const Color kGreyColor = Color(0xffB8BBC6);
  static const Color kDecColor = Color(0xff727583);

  static const LinearGradient customRedButtonGradient = LinearGradient(
      colors: [Color(0xffD94948), Color(0xffFF5C5B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const LinearGradient customBlueButtonGradient = LinearGradient(
      colors: [Color(0xff44739C), Color(0xff29567D)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
