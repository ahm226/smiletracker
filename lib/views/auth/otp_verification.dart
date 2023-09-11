import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/helpers/text_form_field.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/auth/reset_password.dart';

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
          padding:
              EdgeInsets.only(top: 5.h, left: 18.0, right: 18.0, bottom: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                pageTitle: "",
                onTap: () {
                  PageTransition.pageBackNavigation(page: const LoginScreen());
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
                "OTP",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                "Verification",
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
                "We have sent an email to your email account with a verification code!",
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: OtpField(),
              ),
              // Stack(
              //   children: [
              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 22),
              //       child: OtpField(),
              //     ),
              //     Container(
              //       width: 100.w,
              //       height: 10.h,
              //       color: Colors.transparent,
              //     ),
              //   ],
              // ),
              const Expanded(child: SizedBox()),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         "If you didn't receive a OTP?",
              //         style: bodyNormal.copyWith(color: Colors.black87),
              //         textAlign: TextAlign.center,
              //       ),
              //       const SizedBox(
              //         width: 5,
              //       ),
              //       InkWell(
              //         onTap: () {},
              //         child: Text(
              //           "Resend",
              //           style: bodyLarge.copyWith(
              //               fontFamily: "MontserratSemiBold",
              //               color: AppColors.primaryColor,
              //               decoration: TextDecoration.underline),
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Center(
                child: CustomButton(
                    buttonText: "Submit",
                    width: 85.w,
                    onTap: () {
                      PageTransition.pageNavigation(
                          page: const ResetPassword());
                    }),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
