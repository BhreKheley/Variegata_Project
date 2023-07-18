import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/pages/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Container(
        width: 100,
        height: 99.53,
        child: Image.asset(
          'assets/img/splash.png',
          fit: BoxFit.fill,
        ),
      ),
      nextScreen: OnboardingScreen(),
      splashTransition: SplashTransition.sizeTransition,
      backgroundColor: Colors.white,
      duration: 3000,
    );
  }
}
