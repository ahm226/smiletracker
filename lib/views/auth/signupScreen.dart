import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
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
              "Let's Start",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Create a new account",
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
              child: CustomTextField(
                hintText: 'Full Name',
              ),
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
              height: 10.h,
            ),
            Center(
              child: CustomButton(
                buttonText: 'Sign Up',
                onTap: () {},
                width: 85.w,
              ),
            ),
            Center(child: Text("--- Sign Up with ---")),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12, width: 1.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 30,
                            child: Image.asset("assest/images/Facebook.png")),
                        Text("Facebook")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black12, width: 1.4),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 30,
                            child: Image.asset("assest/images/Google.png")),
                        Text("Google")
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: bodyNormal.copyWith(color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign In",
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
