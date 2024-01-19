import 'package:authenticationotp/email%20verification/homes.dart';
import 'package:authenticationotp/email%20verification/signin.dart';
import 'package:authenticationotp/email%20verification/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class firebase {
  final FirebaseAuth _auth;

  firebase(this._auth);

  ///Email SIGNUP

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  ///Email LOGIN
  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) ;
      {
       // await sendEmailVerification(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homes(email: '',)));
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  ///Email VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();

      showSnackBar(context, "Email Verification sent!");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
