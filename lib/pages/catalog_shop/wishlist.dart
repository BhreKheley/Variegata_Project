import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 53, right: 20),
              child: Text(
                "Wishlist",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 29,
                    fontWeight: FontWeight.w700),
              ),
            ),
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
                  "Wishlist Anda kosong saat ini.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
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
                    // Logika atau aksi yang akan dijalankan saat tombol ditekan
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
      ),
    );
  }
}
