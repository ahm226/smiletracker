import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/home/smily_face.dart';
import 'package:smiletracker/views/navbar/bottom_nav_bar.dart';

class DataHelper extends GetxController {
  RxList<Map> moodData = <Map>[].obs;
  double rating = 2.5;
  bool isEmailVerified = false;
  final loggedInGlobal = ValueNotifier(false);

  registerUser(context, emails, pass, name) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emails, password: pass);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(name);
      FirebaseFirestore.instance.collection('users').doc(user.user!.uid).set({
        'email': emails,
        'displayName': name,
        'id': user.user!.uid,
        'imageUrl': '',
        'age': '',
        'phoneNumber': ''
      });
      FirebaseAuth.instance.currentUser?.sendEmailVerification();
      Get.back();
      //setState(() {});
      successPopUp(context, const LoginScreen(),
          'Successfully registered,\n Verification link sent to your email.');
    } catch (error) {
      Get.back();
      //setState(() {});
      errorPopUp(
        context,
        error.toString().replaceRange(0, 14, '').split(']')[1],
      );
    }
  }

  validateUser(context, email, password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userDocId.value = user.user!.uid;

      await FirebaseAuth.instance.currentUser?.reload();

      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (isEmailVerified) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.user!.uid)
            .get()
            .then((value) async {
          userData = UserModel.fromDocument(value.data());
          saveUserData(userID: userDocId.value);
          setUserLoggedIn(true);
          loggedInGlobal.value = true;
          Get.back();
          // setState(() {});
          // setState(() {});
          PageTransition.pageProperNavigation(
              page: BottomNavBar(
            index: 0,
          ));
        });
      } else {
        Get.back();
        // setState(() {});
        errorPopUp(context, "User not verified yet,\n Try again");
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      // setState(() {});
      errorPopUp(
        context,
        e.code == 'user-not-found'
            ? "User not found"
            : (e.code == 'wrong-password')
                ? "The Password you have entered is not correct"
                : e.toString().replaceRange(0, 14, '').split(']')[1],
      );
    }
  }

  resetPassword(context, email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      successPopUp(context, LoginScreen(),
          'To change password an email send to your email account.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorPopUp(context, "There is no record of this email");
      }
    }
  }

  editProfile(name, image, age, phone) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId.value)
        .update({
      "displayName": name,
      "imageUrl": image,
      'age': age,
      'phoneNumber': phone
    });
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDocId.value)
        .get()
        .then((value) async {
      userData = UserModel.fromDocument(value.data());
    });
    return;
  }

  void changePassword(context, currentPassword, newPassword) async {
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: userData.email, password: currentPassword);

    user?.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
        Get.back();
        // setState(() {});
        successPopUp(
            context, const EmojiRatingApp(), 'Password Changed Successfully');
      }).catchError((error) {
        //Error, show something
        Get.back();
        // setState(() {});
        errorPopUp(
            context, 'Error occurred while changing password! Try Again ');
      });
    }).catchError((err) {
      Get.back();
      // setState(() {});
      errorPopUp(context, 'Error occurred while changing password! Try Again ');
    });
  }

  addMoods() async {
    moodData.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data() as Map;
      moodData.add(a);
    }
  }

  postMood(note, rating, date, dateTime) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .doc()
        .set({
      "note": note,
      "rating": rating,
      "date": date,
      "timestamp": Timestamp.fromDate(dateTime),
    });
  }
}
