import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/models/user_model.dart';
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
  bool isEmailVerified = false;
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final GlobalKey<FormState> signInFormField = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInFormField,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assest/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.primaryColor,
                        fontSize: 42,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade800,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CustomTextField(
                      validator: (value) => CustomValidator.email(value),
                      controller: emailEditingController,
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 18.0, end: 12.0),
                        child: Image.asset(
                          "assest/images/EmailIcon.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.only(start: 5.0, end: 18.0),
                          child: Image.asset(
                            !_obscureText
                                ? "assest/images/openEye.png"
                                : "assest/images/closeEye.png",
                            // color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      prefixIcon: Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 18.0, end: 12.0),
                        child: Image.asset(
                          "assest/images/LockIcon.png",
                          height: 20,
                          width: 20,
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
                      onTap: () async {
                        if (signInFormField.currentState!.validate()) {
                          // PageTransition.pageProperNavigation(
                          //     page: const EmojiRatingApp());

                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Mood Meter",
                              titleStyle: const TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              ),
                              middleText: "",
                              content: const Column(
                                children: [
                                  Center(
                                      child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ))
                                ],
                              ));
                          await validateUser(
                              emailEditingController.text.removeAllWhitespace
                                  .toLowerCase(),
                              passwordEditingController.text);
                        }
                      },
                      width: 90.w,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const ForgotPassword());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )),
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
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
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
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
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
      ),
    );
  }

  validateUser(email, password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userDocId.value = user.user!.uid;

      await FirebaseAuth.instance.currentUser?.reload();

      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (isEmailVerified) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.user!.uid)
            .get()
            .then((value) async {
          setState(() {
            userData = UserModel.fromDocument(value.data());
          });
          saveUserData(userID: userDocId.value);
          setUserLoggedIn(true);
          setState(() {
            loggedInGlobal.value = true;
          });
          Get.back();
          setState(() {});
          setState(() {});
          PageTransition.pageProperNavigation(page: const EmojiRatingApp());
        });
      } else {
        Get.back();
        setState(() {});
        errorPopUp(
            context, "Sorry, There is some issue in proceeding. Try later");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      setState(() {});
      errorPopUp(
        context,
        e.code == 'user-not-found'
            ? "User not found"
            : (e.code == 'wrong-password')
                ? "The Password you have entered is not correct"
                : e.toString().replaceRange(0, 14, '').split(']')[1],
      );
    }
  }
}
