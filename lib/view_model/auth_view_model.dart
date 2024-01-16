import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../utils/utils.dart';
import '../views/landing_screen.dart';
import '../views/verify_otp_screen.dart';

class AuthViewModel extends ChangeNotifier {
  String? verificationId;
  String? phoneNumber;
  String? verifyOtpErrorText;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> sendOtp(BuildContext context, AuthViewModel authViewModel,
      {required String? phoneNumber}) async {
    isLoading.value = true;
    this.phoneNumber = AppConstants.countryCode + phoneNumber!;
    await AuthService.sendOtp(
      phoneNumber: this.phoneNumber,
      verificationFailed: (firebaseAuthException) {
        debugPrint(
            "firebaseAuthException.code:\t${firebaseAuthException.code}");
        debugPrint(
            "firebaseAuthException.message:\t${firebaseAuthException.message}");
        isLoading.value = false;
        String snackBarMessage = '';
        switch (firebaseAuthException.code) {
          case 'invalid-phone-number':
            snackBarMessage = 'enter valid phone number.';
            break;
          /*case 'missing-client-identifier':
            break;*/
          case 'too-many-requests':
            snackBarMessage =
                'sorry, you have made too many requests, please try after some time.';
          default:
            snackBarMessage =
                'something went wrong, please try after some time.';
        }
        Utils.displaySnackBar(context, contentText: snackBarMessage);
      },
      onError: () {
        isLoading.value = false;
        Utils.displaySnackBar(context,
            contentText: "something went wrong, please try after some time");
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        this.verificationId = verificationId;
        isLoading.value = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider<AuthViewModel>.value(
              value: authViewModel,
              builder: (context, child) => const VerifyOtpScreen(),
            ),
          ),
        );
      },
    );
    // isLoading.value = false;
  }

  Future<void> verifyOtp(
    BuildContext context, {
    required String smsCode,
  }) async {
    isLoading.value = true;
    UserCredential? response = await AuthService.verifyOtp(
      verificationId: verificationId!,
      smsCode: smsCode,
      errorMessage: (code, message) {
        isLoading.value = false;
        String snackBarMessage = '';
        switch (code) {
          case '':
            snackBarMessage = 'enter the valid otp.';
            break;
          default:
            snackBarMessage =
                'something went wrong, please try after some time.';
        }
        Utils.displaySnackBar(context, contentText: snackBarMessage);
      },
    );
    isLoading.value = false;
    if (response != null) {
      if (!context.mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
        (route) => false,
      );
    }
  }
}
