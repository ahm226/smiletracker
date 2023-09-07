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
        // resizeToAvoidBottomInset: false,
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
                children: [
                  CustomAppBar(
                    pageTitle: "Edit Profile",
                    onTap: () {
                      Get.back();
                    },
                    leadingButton: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 400),
                    slidingBeginOffset: const Offset(0, 0),
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 15.h,
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
                          right: 26.w,
                          bottom: 1.h,
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
                            child: const CircleAvatar(
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
                  const SizedBox(
                    height: 30,
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 500),
                    slidingBeginOffset: const Offset(0, -1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Full Name:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
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
                    delay: const Duration(milliseconds: 500),
                    slidingBeginOffset: const Offset(0, -1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Age:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          validator: (value) => CustomValidator.isEmpty(value),
                          hintText: "27 years",
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 700),
                    slidingBeginOffset: const Offset(0, -1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Parent/ Student Email Address:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          validator: (value) => CustomValidator.email(value),
                          hintText: "robert123@gmail.com",
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 18.0, end: 15.0),
                            child: Image.asset(
                              "assest/images/EmailIcon.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const DelayedDisplay(
                    delay: Duration(milliseconds: 700),
                    slidingBeginOffset: Offset(0, -1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Number:",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CountryCodePicker(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 1000),
                    slidingBeginOffset: const Offset(0, 0),
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
}
