import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:sizer/sizer.dart';
import 'package:smiletracker/Helpers/country_number_widget.dart';
import 'package:smiletracker/Helpers/custom_validator.dart';
import 'package:smiletracker/Helpers/custom_widgets.dart';
import 'package:smiletracker/Helpers/globalvariables.dart';
import 'package:smiletracker/Helpers/text_form_field.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool loader = false;
  late PickedFile pickedFile;
  String? imageUrl;
  File? imageFile;
  final picker = ImagePicker();
  bool processingStatus = false;
  FirebaseStorage storage = FirebaseStorage.instance;
  XFile? pickedImage;
  final GlobalKey<FormState> profileField = GlobalKey();

  getData() {
    setState(() {
      nameController.text = userData.displayName;
      ageController.text = userData.age;
      phoneController.text = userData.phoneNumber;
      imageUrl = userData.imageUrl;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
                            child: imageFile != null
                                ? Image.file(imageFile!)
                                : (userData.imageUrl != "" &&
                                        userData.imageUrl != null)
                                    ? Image.network(userData.imageUrl)
                                    : Image.asset(
                                        "assest/images/profile.png",
                                      ),

                            //-------
                            // Image.asset(
                            //   "assest/images/profile.png",
                            // ),
                          ),
                        ),
                        Positioned(
                          right: 26.w,
                          bottom: 1.h,
                          child: ZoomTapAnimation(
                            onTap: () {
                              _upload("gallery");
                            },
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
                          controller: nameController,
                          validator: (value) =>
                              CustomValidator.isEmptyUserName(value),
                          hintText: userData.displayName,
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
                          controller: ageController,
                          validator: (value) => CustomValidator.isEmpty(value),
                          hintText: "27 years",
                          keyboardType: TextInputType.number,
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
                          hintText: userData.email,
                          isReadOnly: true,
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
                  DelayedDisplay(
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
                        CountryCodePicker(
                          phoneController: phoneController,
                        ),
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
                        onTap: () async {
                          if (key.currentState!.validate()) {
                            Get.defaultDialog(
                                barrierDismissible: false,
                                title: "Mood Meter",
                                middleText: "",
                                content: const Column(
                                  children: [
                                    Center(
                                        child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ))
                                  ],
                                ));

                            await editProfile();
                            Get.back();
                          }
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

  editProfile() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId.value)
        .update({
      "displayName": nameController.text,
      "imageUrl": imageUrl,
      'age': ageController.text,
      'phoneNumber': phoneController.text
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId.value)
        .get()
        .then((value) async {
      setState(() {
        userData = UserModel.fromDocument(value.data());
      });
    });
    return;
  }

  Future<void> _upload(String inputSource) async {
    Get.defaultDialog(
        barrierDismissible: false,
        title: "Mood Meter",
        middleText: "",
        content: const Column(
          children: [
            Center(
                child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ))
          ],
        ));
    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);
      setState(() {
        processingStatus = true;
      });
      final String fileName = path.basename(pickedImage!.path);
      try {
        // Uploading the selected image with some custom meta data
        {
          imageFile = File(pickedImage!.path);
          await storage.ref(fileName).putFile(imageFile!).then((p0) async {
            imageUrl = await p0.ref.getDownloadURL();
            setState(() {});
            if (p0.state == TaskState.success) {
              setState(() {
                processingStatus = false;
              });
            }
          });
        }
        // Refresh the UI
        Get.back();
        setState(() {});
      } on FirebaseException catch (error) {
        Get.back();
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      Get.back();
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
