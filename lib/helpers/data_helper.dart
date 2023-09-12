import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smiletracker/helpers/custom_widgets.dart';
import 'package:smiletracker/helpers/globalvariables.dart';
import 'package:smiletracker/helpers/page_navigation.dart';
import 'package:smiletracker/helpers/time_date_functions.dart';
import 'package:smiletracker/models/user_model.dart';
import 'package:smiletracker/views/auth/login_screen.dart';
import 'package:smiletracker/views/home/smily_face.dart';
import 'package:smiletracker/views/navbar/bottom_nav_bar.dart';

class DataHelper extends GetxController {
  RxList<Event> moods = <Event>[].obs;
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
          PageTransition.pageProperNavigation(page: BottomNavBar());
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
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i].data() as Map;
      print(TimeDateFunctions.dateInDigits(a['date']));
      DateTime date = TimeDateFunctions.dateInDigits(a['date']);
      moods.add(
        Event(
          child: DelayedDisplay(
            delay: const Duration(milliseconds: 150),
            slidingBeginOffset: const Offset(0, 1),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          a['rating'] > 2.4 ? "Feeling Happy" : "Feeling Sad",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Image.asset(a['rating'] > 2.4
                            ? "assest/images/happyIcon.png"
                            : "assest/images/happyIcon.png"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(a["note"]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat('EEEE , d MMMM').format(date).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          dateTime: CalendarDateTime(
            year: date.year,
            month: date.month,
            day: date.day,
            calendarType: CalendarType.GREGORIAN,
          ),
        ),
      );
    }
  }

  postMood(note, rating, date) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.userID)
        .collection("myMoods")
        .doc()
        .set({
      "note": note,
      "rating": rating,
      "date": date,
    });
  }
}
