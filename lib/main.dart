import 'package:flutter/material.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/auth/register_page.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'package:variegata_project/pages/profile_page.dart';
import 'package:variegata_project/pages/screens/SplashScreen.dart';
import 'package:variegata_project/pages/screens/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Variegata',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
    );
  }
}
