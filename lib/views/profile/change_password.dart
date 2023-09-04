import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';

import '../../Helpers/custom_widgets.dart';
import '../../Helpers/text_form_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ChangePassword> {
  bool _obscureText = true;
  bool _obscureTextConfirm = true;
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> resetFormField = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: resetFormField,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: CustomAppBar(
            pageTitle: "Change Password",
            onTap: () {
              Get.back();
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
                    validator: (value) => CustomValidator.password(value),
                    controller: passwordEditingController,
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
                Padding(
                  padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
                  child: CustomTextField(
                    validator: (value) => CustomValidator.confirmPassword(
                        value, passwordEditingController.text),
                    controller: confirmPasswordEditingController,
                    hintText: 'Confirm Password',
                    isObscure: _obscureTextConfirm,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          _obscureTextConfirm = !_obscureTextConfirm;
                        });
                      },
                      child: Icon(
                        !_obscureTextConfirm
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
                      buttonText: 'Save Password',
                      width: 85.w,
                      onTap: () {
                        if (resetFormField.currentState!.validate()) {
                          // PageTransition.pageProperNavigation(
                          //     page: const LoginScreen());
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
