import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/home/smily_face.dart';

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
        PageTransition.pageProperNavigation(page: const EmojiRatingApp());
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
      body: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assest/images/Background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Mood",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 54,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Text(
                  "Meter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 54,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SpinKitCircle(
              color: Colors.black, // Set the spinner color
              size: 52.0, // Set the size of the spinner
            )
          ],
        ),
      ),
    );
  }
}
