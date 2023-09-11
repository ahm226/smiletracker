import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthenticateProvider extends ChangeNotifier {
  GoogleSignInAccount? _currentUser;
  final _auth = FirebaseAuth.instance;
  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Future loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        _user = googleUser;
        notifyListeners();
      } else {
        return;
      }
      final googleAuth = await googleUser.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credentials);
      User user = FirebaseAuth.instance.currentUser!;
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email,
        'displayName': user.displayName,
        'id': user.uid,
        'imageUrl': '',
        'age': '',
        'phoneNumber': ''
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logoutGoogleAcc() async {
    await _googleSignIn.disconnect();
    _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
//
// class FBAuthenticateProvider extends ChangeNotifier {
//   Future<void> signInFB(BuildContext context, bool fromLogin) async {
//     try {
//       final LoginResult result =
//           await FacebookAuth.i.login(permissions: ["email"]);
//
//       print("checkFB");
//       print(result);
//
//       if (result.status == LoginStatus.success) {
//         print("hello");
//
//         final data = await FacebookAuth.i.getUserData();
//         print('hello i am data of fb');
//         print(data);
//         print(data['email']);
//         String email = '${'f' + data['id']}@facebook.com';
//         print(email);
//
//         Map<String, dynamic> signupToMap = {
//           'name': data['name'].split(" ")[0].toString(),
//           'company_information': " ",
//           'phone_number': " ",
//           'email': email.toString(),
//           'address': " ",
//           'password': " ",
//           'login_type': "1"
//         };
//         await AuthApiService.instance.signupFromApi(signupToMap, context);
//
//         // socialRegister(
//         //     'facebook',
//         //     data['id'].toString(),
//         //     data['name'].split(" ")[0].toString(),
//         //     data['name'].split(" ")[1].toString(),
//         //     email,
//         //     "",
//         //     "facebook",
//         //     context);
//         notifyListeners();
//       }
//     } catch (e) {
//       print('Error is $e');
//     }
//   }
//
//   Future<void> signOutFB() async {
//     await FacebookAuth.i.logOut();
//     setUserLoggedIn(false);
//   }
// }
