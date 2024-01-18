import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constants.dart';
import '../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashViewModel _splashViewModel;

  @override
  void initState() {
    super.initState();
    _splashViewModel = SplashViewModel();
    _splashViewModel.load(context);
  }

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
