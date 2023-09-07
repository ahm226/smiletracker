import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/text_form_field.dart';
import 'package:smiletracker/views/auth/loginScreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
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
          child: Padding(
            padding: EdgeInsets.only(
                top: 5.h, left: 18.0, right: 18.0, bottom: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    pageTitle: "",
                    onTap: () {
                      Get.back();
                      // Get.off(() => LoginScreen(controller: TextEditingController()));
                    },
                    leadingButton: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Forgot ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const Text(
                    "Password?",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 42,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Recover your password if you have forgot the password!",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
                    child: CustomTextField(
                        validator: (value) => CustomValidator.email(value),
                        controller: emailEditingController,
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: CustomButton(
                      width: 90.w,
                      buttonText: "Send Code",
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          await resetPassword(
                              email: emailEditingController.text);
                          // PageTransition.pageBackNavigation(
                          //     page: const VerifyEmail());
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      successPopUp(context, LoginScreen(),
          'To change password an email send to your email account.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorPopUp(context, "There is no record of this email");
      }
    }
  }
}
