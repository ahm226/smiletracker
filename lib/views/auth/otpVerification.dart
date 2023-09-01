import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/text_form_field.dart';
import 'package:smiletracker/views/auth/resetPassword.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
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
            // Get.off(() => ForgotPassword(controller: TextEditingController()));
          },
          leadingButton: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Forgot ",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Password?",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "We have sent an email to your email account with a verification code!",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: OtpField(),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you didn't receive a OTP?",
                    style: bodyNormal.copyWith(color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Resend",
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
            Center(
              child: CustomButton(
                  buttonText: "Submit",
                  width: 85.w,
                  onTap: () {
                    Get.to(() => const ResetPassword());
                  }),
            ),
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
