import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/auth_provider.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:smiletracker/views/auth/loginScreen.dart';
import 'package:smiletracker/views/home/smily_face.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  bool _obscureText = true;
  final TextEditingController nameEditingController = TextEditingController();
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
                    "Let's Start",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: AppColors.primaryColor,
                      fontSize: 42,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Create a new account",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Colors.grey.shade800,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                    child: CustomTextField(
                        controller: nameEditingController,
                        validator: (value) =>
                            CustomValidator.isEmptyUserName(value),
                        hintText: 'Full Name',
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 18.0, end: 12.0),
                          child: Image.asset(
                            "assest/images/user.png",
                            height: 20,
                            width: 20,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                    child: CustomTextField(
                        controller: emailEditingController,
                        validator: (value) => CustomValidator.email(value),
                        hintText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 18.0, end: 12.0),
                          child: Image.asset(
                            "assest/images/EmailIcon.png",
                            height: 20,
                            width: 20,
                          ),
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
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 5.0, end: 18.0),
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
                    height: 5.h,
                  ),
                  Center(
                    child: CustomButton(
                      buttonText: 'Sign Up',
                      onTap: () async {
                        if (signInFormField.currentState!.validate()) {
                          // PageTransition.pageProperNavigation(
                          //     page: const LoginScreen());

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
                          await registerUser(
                            emailEditingController.text.removeAllWhitespace
                                .toLowerCase(),
                            passwordEditingController.text,
                            nameEditingController.text,
                          );
                        }
                      },
                      width: 90.w,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: Text(
                    "--- Sign Up with ---",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  )),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 31.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black12, width: 1.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                      "assest/images/Facebook.png")),
                              const Text(
                                "Facebook",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      InkWell(
                        onTap: () async {
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
                          await Provider.of<GoogleAuthenticateProvider>(context,
                                  listen: false)
                              .loginWithGoogle();
                          loggedInGlobal.value = true;
                          FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .get()
                              .then((value) async {
                            setState(() {
                              userData = UserModel.fromDocument(value.data());
                            });
                            print("userData.displayName");
                            print(userData.userID);
                            print(userData.displayName);
                            print(userData.email);
                            saveUserData(userID: userData.userID);
                            setUserLoggedIn(true);
                          });
                          Get.back();
                          successPopUp(context, const EmojiRatingApp(),
                              'Successfully registered,\n Verification link sent to your email.');
                        },
                        child: Container(
                          height: 50,
                          width: 31.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border:
                                Border.all(color: Colors.black12, width: 1.4),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    height: 30,
                                    child: Image.asset(
                                        "assest/images/google.png")),
                                const Text(
                                  "Google",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
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
                                page: const LoginScreen());
                          },
                          child: const Text(
                            "Sign In",
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

  registerUser(emails, pass, name) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emails, password: pass);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
        'email': emails,
        'displayName': name,
        'id': user.user!.uid,
        'imageUrl': '',
        'age': '',
        'phoneNumber': ''
      });
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.back();
      setState(() {});
      successPopUp(context, const LoginScreen(),
          'Successfully registered,\n Verification link sent to your email.');
      // return AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.success,
      //   desc:
      //       'Successfully registered,\n Verification link sent to your email',
      //   btnOkOnPress: () {
      //     PageTransition.pageProperNavigation(page: const LoginScreen());
      //   },
      // ).show();
    } catch (error) {
      Get.back();
      setState(() {});
      return AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        btnOkOnPress: () {},
        desc: error.toString().replaceRange(0, 14, '').split(']')[1],
      ).show();
    }
  }
}
