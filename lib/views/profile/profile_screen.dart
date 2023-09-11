import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/profile/change_password.dart';
import 'package:smiletracker/views/profile/edit_profile.dart';
import 'package:smiletracker/views/subscription/sub_plans.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loader = false;
  late PickedFile pickedFile;
  String? imageUrl;
  File? imageFile;
  final picker = ImagePicker();
  bool processingStatus = false;
  XFile? pickedImage;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(
                pageTitle: "My Profile",
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
              Container(
                height: 15.h,
                width: 15.h,
                child: userData.imageUrl == ""
                    ? Image.asset(
                        "assest/images/profileImage.png",
                      )
                    : Image.network(
                        userData.imageUrl,
                      ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                userData.displayName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  PageTransition.pageNavigation(page: const ChoosePlan());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.w,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Upgrade to Premium",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "This subscription is auto-renewable",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  PageTransition.pageNavigation(page: const EditProfile());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  PageTransition.pageNavigation(page: const ChangePassword());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setUserLoggedIn(false);
                  FirebaseAuth.instance.signOut();
                  PageTransition.pageProperNavigation(
                      page: const LoginScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(
                          12.0), // Adjust the radius as needed
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign Out",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
