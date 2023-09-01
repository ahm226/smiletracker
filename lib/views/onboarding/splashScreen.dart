import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiletracker/views/auth/loginScreen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  getData() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAll(() => LoginScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Mood",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Meter",
            style: TextStyle(
                color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
