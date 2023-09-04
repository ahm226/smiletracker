import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/views/auth/forgotPasswordScreen.dart';
import 'package:smiletracker/views/auth/signupScreen.dart';
import 'package:smiletracker/views/home/smily_face.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> signInFormField = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInFormField,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                const Text(
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
                      validator: (value) => CustomValidator.email(value),
                      controller: emailEditingController,
                      hintText: 'Email Address',
                      suffixIcon: Icon(
                        Icons.mail_outline,
                        color: AppColors.primaryColor,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                  child: CustomTextField(
                    controller: passwordEditingController,
                    validator: (value) => CustomValidator.password(value),
                    hintText: 'Password',
                    isObscure: _obscureText,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        !_obscureText
                            ? Icons.lock_open_outlined
                            : Icons.lock_outline_rounded,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: CustomButton(
                    buttonText: 'Login',
                    onTap: () {
                      if (signInFormField.currentState!.validate()) {
                        PageTransition.pageProperNavigation(
                            page: const EmojiRatingApp());
                      }
                    },
                    width: 90.w,
                  ),
                ),
                InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const ForgotPassword());
                    },
                    child: const Center(child: Text("Forgot Password?"))),
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
                        onTap: () {
                          PageTransition.pageNavigation(
                              page: const SignupScreen());
                        },
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
        ),
      ),
    );
  }
}
