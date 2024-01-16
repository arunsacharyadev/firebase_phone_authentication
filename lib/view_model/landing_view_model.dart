import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../views/send_otp_screen.dart';
import 'auth_view_model.dart';

class LandingViewModel extends ChangeNotifier {
  Future<void> signout(BuildContext context) async {
    await AuthService.signOut();
    if (!context.mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
          builder: (context, child) => const SendOtpScreen(),
        ),
      ),
      (route) => false,
    );
  }
}
