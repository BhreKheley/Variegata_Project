import 'package:flutter/material.dart';

import '../../catalog_shop/dashboard_catalog.dart';

class TabDiproses extends StatefulWidget {
  const TabDiproses({super.key});

  @override
  State<TabDiproses> createState() => _TabDiprosesState();
}

class _TabDiprosesState extends State<TabDiproses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 204),
            child: Center(
              child: Image(
                image: AssetImage("assets/img/wishlist.png"),
                width: 130,
                height: 108,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 16,
              right: 20,
            ),
            child: Center(
              child: Text(
                "Belum ada item yang Diproses nih.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 13,
              right: 20,
            ),
            child: Center(
              child: Text(
                "Yuk, mulai tambahkan item favorit Anda!",
                style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 22, right: 20),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KatalogShop()));
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(147, 36),
                  backgroundColor: Color(0xFFF6F7FA),
                  side: BorderSide(color: Colors.black, width: 2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                child: Text(
                  "Tambahkan Sekarang",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}