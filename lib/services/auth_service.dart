import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<void> sendOtp({
    String? phoneNumber,
    required void Function(String verificationId, int? forceResendingToken)
        codeSent,
    void Function(FirebaseAuthException)? verificationFailed,
    Function? onError,
  }) async {
    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: verificationFailed ?? (FirebaseAuthException e) {},
      codeSent: codeSent,
      codeAutoRetrievalTimeout: (String verificationId) {},
    )
        .onError((error, stackTrace) {
      if (onError != null) {
        onError();
      }
    });
  }

  static Future<UserCredential?>? verifyOtp({
    required String verificationId,
    required String smsCode,
    Function(String? code, String? message)? errorMessage,
  }) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    try {
      UserCredential user =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return user;
    } on FirebaseAuthException catch (e) {
      if (errorMessage != null) errorMessage(e.code, e.message.toString());
    } catch (e) {
      if (errorMessage != null) errorMessage(null, e.toString());
    }
    return Future.value(null);
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static bool isUserLoggedIn() {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }
}
