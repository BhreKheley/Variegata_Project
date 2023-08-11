import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/cart.dart';
import 'package:variegata_project/pages/catalog_shop/checkout.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/wishlist.dart';
import 'package:variegata_project/pages/dashboard/dashboard_page.dart';
import 'package:variegata_project/pages/profile/profile_page.dart';
import 'package:variegata_project/pages/screens/SplashScreen.dart';

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
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}
