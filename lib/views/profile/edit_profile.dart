import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/country_number_widget.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/text_form_field.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

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
            pageTitle: "Edit Profile",
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
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 400),
                  slidingBeginOffset: Offset(0, 0),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Container(
                          child: Image.asset(
                            "assest/images/profile.png",
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   radius: 60,
                      //   backgroundColor: AppColors.primaryColor,
                      //   child: CircleAvatar(
                      //     radius: 58,
                      //     backgroundImage:
                      //         AssetImage("assest/images/profile.png"),
                      //   ),
                      // ),
                      Positioned(
                        right: 85,
                        bottom: 25,
                        child: ZoomTapAnimation(
                          onTap: () {},
                          onLongTap: () {},
                          enableLongTapRepeatEvent: false,
                          longTapRepeatDuration:
                              const Duration(milliseconds: 100),
                          begin: 1.0,
                          end: 0.93,
                          beginDuration: const Duration(milliseconds: 20),
                          endDuration: const Duration(milliseconds: 120),
                          beginCurve: Curves.decelerate,
                          endCurve: Curves.fastOutSlowIn,
                          child: CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 16,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  slidingBeginOffset: Offset(0, -1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Full Name:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        validator: (value) =>
                            CustomValidator.isEmptyUserName(value),
                        hintText: "Robert Fox",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  slidingBeginOffset: Offset(0, -1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        validator: (value) => CustomValidator.isEmpty(value),
                        hintText: "27 years",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DelayedDisplay(
                  delay: Duration(milliseconds: 700),
                  slidingBeginOffset: Offset(0, -1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Parent/ Student Email Address:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        validator: (value) => CustomValidator.email(value),
                        hintText: "robert123@gmail.com",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                DelayedDisplay(
                  delay: Duration(milliseconds: 700),
                  slidingBeginOffset: Offset(0, -1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone Number:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CountryCodePicker(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1000),
                  slidingBeginOffset: Offset(0, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: CustomButton(
                      width: 100.w,
                      buttonText: "Save Changes",
                      onTap: () {
                        if (key.currentState!.validate()) {}
                      },
                    ),
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
