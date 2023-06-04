import 'package:flutter/material.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/pages/catalog_shop/alat_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/tanaman_catalog.dart';
import 'package:variegata_project/pages/dashboard/dashboard_page.dart';
import 'package:variegata_project/pages/splash_screen/SplashScreen.dart';

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
      home: KatalogShop(),
    );
  }
}
