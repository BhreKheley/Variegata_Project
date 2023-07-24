import 'package:flutter/material.dart';
import 'package:variegata_project/pages/informasi.dart';

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
      home: InformasiPage(),
    );
  }
}
