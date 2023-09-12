import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_validator.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/data_helper.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/text_form_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final DataHelper _dataController = Get.find<DataHelper>();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            leadingButton: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: 5.h, left: 18.0, right: 18.0, bottom: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forgot Password?", style: headingLarge),
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
                        padding:
                            EdgeInsetsDirectional.only(start: 18.0, end: 12.0),
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
                        await _dataController.resetPassword(
                            context, emailEditingController.text);
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
    );
  }
}
