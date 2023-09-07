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
              padding: EdgeInsets.only(
                  top: 5.h, left: 18.0, right: 18.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Reset Password?",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Set your new password to login into your account!",
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
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
                          padding:
                              EdgeInsetsDirectional.only(start: 5.0, end: 12.0),
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
                            EdgeInsetsDirectional.only(start: 12.0, end: 5.0),
                        child: Image.asset(
                          "assest/images/LockIcon.png",
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 8.0),
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
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.only(start: 5.0, end: 12.0),
                          child: Image.asset(
                            !_obscureTextConfirm
                                ? "assest/images/openEye.png"
                                : "assest/images/closeEye.png",
                            // color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      prefixIcon: Padding(
                        padding:
                            EdgeInsetsDirectional.only(start: 12.0, end: 5.0),
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
                        buttonText: 'Save Changes',
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
      ),
    );
  }
}
