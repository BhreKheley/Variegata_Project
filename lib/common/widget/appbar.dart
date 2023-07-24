import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Appbars extends StatelessWidget {
  String title, navigate;
  Appbars({
    required this.title,
    required this.navigate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
          "Toko Variegata",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () => print(navigate.toString()),
        ),
    );
  }
}
