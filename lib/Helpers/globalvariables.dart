import 'package:flutter/material.dart';

///---------App Colors

class AppColors {
  static const Color primaryColor = Color(0xffff5C00);
  static const Color secondaryColor = Color(0xffeceaef);
  static const Color scaffoldColor = Colors.white;
  static const Color buttonColor = Color(0xff033d94);
  static const Color goldColor = Color(0xffE3BD66);
  static const Color textFieldColor = Color(0xffE3BD66);
}

///---------App Texts
TextStyle headingLarge = const TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontFamily: 'MontserratBold',
    fontWeight: FontWeight.w700);
TextStyle headingMedium = const TextStyle(
    fontSize: 18, color: Colors.black, fontFamily: 'MontserratSemiBold');
TextStyle headingSmall = const TextStyle(
    fontSize: 17, color: Colors.black, fontFamily: 'MontserratSemiBold');
TextStyle bodyLarge = const TextStyle(
    fontSize: 16, color: Colors.black, fontFamily: 'MontserratRegular');
TextStyle bodyNormal = const TextStyle(
    fontSize: 14, color: Colors.black, fontFamily: 'MontserratRegular');
TextStyle bodySmall = const TextStyle(
    fontSize: 10,
    color: Colors.black,
    fontFamily: 'MontserratRegular',
    height: 1.5);

TextStyle title =
    const TextStyle(fontSize: 12, color: Colors.white12, fontFamily: 'Inter');
TextStyle hintText =
    const TextStyle(fontSize: 12, color: Colors.black26, fontFamily: 'Inter');