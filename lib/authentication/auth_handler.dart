import 'package:buy_sell/Home/Screens/home_screen.dart';
import 'package:buy_sell/authentication/screens/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHandler {
  FirebaseAuth auth = FirebaseAuth.instance;

  void verifyOTP(
      String verificationId, String otpCode, BuildContext context) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );
      await auth.signInWithCredential(credential);
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const HomeScreen();
      }));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void sendPhoneNoToDB(String phoneNo, BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return OtpScreen(
                  phoneNo: phoneNo,
                  verificationId: verificationId,
                );
              },
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
