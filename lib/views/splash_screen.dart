import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/utils.dart';
import '../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _splashViewModel.load(context);
    super.initState();
  }

  final SplashViewModel _splashViewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('${AppConstants.appLottiesBasePath}loading.json'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
