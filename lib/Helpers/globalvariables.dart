import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smiletracker/models/user_model.dart';

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
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700);
TextStyle headingMedium = const TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle headingSmall = const TextStyle(
  fontSize: 17,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodyLarge = const TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodyNormal = const TextStyle(
  fontSize: 14,
  color: Colors.black,
  fontFamily: 'Poppins',
);
TextStyle bodySmall = const TextStyle(
    fontSize: 10, color: Colors.black, fontFamily: 'Poppins', height: 1.5);

///----------App variable
final userDocId = ValueNotifier("");
final loggedInGlobal = ValueNotifier(false);

UserModel userData = UserModel(
  age: '',
  phoneNumber: '',
  userID: "",
  displayName: "",
  email: "",
  imageUrl: "",
);

void setUserLoggedIn(bool key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLoggedIn", key);
}

Future getUserLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var log = prefs.getBool("isLoggedIn") ?? false;
  return log;
}

void saveUserData({@required userID}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("userID", userID);
}

Future getUserData() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? result = pref.getString("userID");
  return result;
}
