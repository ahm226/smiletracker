import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/helpers/theme_service.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/navbar/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool login;

  getData() async {
    // Future.delayed(const Duration(milliseconds: 10000), () {
    //   PageTransition.pageProperNavigation(page: const EmojiRatingApp());
    // });

    login = await getUserLoggedIn();
    if (login == true) {
      var userid = await getUserData();
      userDocId.value = userid.toString();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userDocId.value)
          .get()
          .then((value) async {
        setState(() {
          userData = UserModel.fromDocument(value.data());
        });
      });
      Future.delayed(const Duration(milliseconds: 5000), () {
        PageTransition.pageProperNavigation(
            page: BottomNavBar(
          index: 0,
        ));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 5000), () {
        PageTransition.pageProperNavigation(page: const LoginScreen());
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assest/images/splashIcon.png",
              height: 160,
              width: 130,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Center(
                child: Text(
                  "Mood",
                  style: TextStyle(
                    fontSize: 54,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Text(
                "Meter",
                style: TextStyle(
                  fontSize: 54,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SpinKitCircle(
            color: ThemeService().isDarkMode
                ? Colors.white
                : Colors.black, // Set the spinner color
            size: 52.0, // Set the size of the spinner
          )
        ],
      ),
    );
  }
}
