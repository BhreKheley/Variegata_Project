import 'package:flutter/material.dart';
import 'package:variegata_project/pages/budidaya/Detail_Content.dart';

class LargeContent extends StatelessWidget {
  const LargeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => ContentDetail(),
      //     ),
      //   );
      // },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage("assets/img/budidaya/pertumbuhan.png"),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xFFE3CA8A),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Pelatihan tanaman',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 13),
              child: Text(
                'Jarangkan bibit untuk menghasil kan tegakan tanaman yang sehat',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              'Klik lebih lanjut',
              style: TextStyle(
                color: Color(0xFFBBD6B8),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
