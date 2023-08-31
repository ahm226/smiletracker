import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Welcome Back!",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Login to your account",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
              child: CustomTextField(
                  hintText: 'Email Address',
                  suffixIcon: Icon(
                    Icons.mail_outline,
                    color: AppColors.primaryColor,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
              child: CustomTextField(
                  hintText: 'Password',
                  suffixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.primaryColor,
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            Center(
              child: CustomButton(
                buttonText: 'Login',
                onTap: () {},
                width: 85.w,
              ),
            ),
            Center(child: Text("Forgot Password?")),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: bodyNormal.copyWith(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: bodyLarge.copyWith(
                          fontFamily: "MontserratSemiBold",
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
