import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../views/landing_screen.dart';
import '../views/send_otp_screen.dart';
import 'auth_view_model.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> load(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 7),
      () {
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(
            builder: (context) => AuthService.isUserLoggedIn()
                ? const LandingScreen()
                : ChangeNotifierProvider(
                    create: (context) => AuthViewModel(),
                    builder: (context, child) => const SendOtpScreen(),
                  ),
          ),
          (route) => false,
        );
      },
    );
  }
}
