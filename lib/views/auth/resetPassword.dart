import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/views/auth/loginScreen.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          pageTitle: "",
          onTap: () {
            // Get.off(() => LoginScreen(controller: TextEditingController()));
          },
          leadingButton: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset ",
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
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Set your new password to login into your account!",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 12.h,
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
              Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
                child: CustomTextField(
                    hintText: 'Confirm Password',
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
                    buttonText: 'Continue',
                    width: 85.w,
                    onTap: () {
                      Get.to(() => const LoginScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
