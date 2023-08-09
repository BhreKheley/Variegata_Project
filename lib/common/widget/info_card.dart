import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardInfo extends StatelessWidget {
  String image, title, kategori;
  CardInfo({
    required this.image,
    required this.title,
    required this.kategori,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0xFFE4E4E4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Center(
                  child: Text(
                    kategori.toString(),
                    style: TextStyle(
                      color: Color(0xFFB9B9B9),
                      fontSize: 8,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    // textAlign: ,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 184,
                child: Text(
                  title.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Image.asset(
                      "assets/img/logo-mini.png",
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Variegata ',
                    style: TextStyle(
                      color: Color(0xFFBABABA),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFBABABA),
                    ),
                  ),
                  Text(
                    'Apr 04, 2023   ',
                    style: TextStyle(
                      color: Color(0xFFBABABA),
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Warna shadow
                  spreadRadius: 2, // Jarak penyebaran shadow
                  blurRadius: 5, // Radius blur shadow
                  offset: Offset(0, 2), // Offset atau posisi shadow
                ),
              ],
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/$image',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
