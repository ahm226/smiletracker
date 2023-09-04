import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/page_navigation.dart';
import 'package:smiletracker/Helpers/text_form_field.dart';
import 'package:smiletracker/views/auth/otpVerification.dart';

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
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            pageTitle: "",
            onTap: () {
              Get.back();
              // Get.off(() => LoginScreen(controller: TextEditingController()));
            },
            leadingButton: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Forgot ",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Password?",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Recover you password if you have forgot the password!",
                  style: bodyNormal.copyWith(fontFamily: "Inter"),
                ),
                SizedBox(
                  height: 80,
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
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: CustomButton(
                    width: 90.w,
                    buttonText: "Send Code",
                    onTap: () {
                      if (key.currentState!.validate()) {
                        PageTransition.pageBackNavigation(
                            page: const VerifyEmail());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
