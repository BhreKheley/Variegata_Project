import 'package:flutter/material.dart';

class Cuaca extends StatefulWidget {
  Cuaca({Key? key}) : super(key: key);

  @override
  State<Cuaca> createState() => _CuacaState();
}

class _CuacaState extends State<Cuaca> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.blue,
        image: DecorationImage(
            image: AssetImage('assets/img/dashboard/bg-awan.png'),
            colorFilter: ColorFilter.mode(
                Color(0xFF939393).withOpacity(0.4), BlendMode.color)),
      ),
      height: 191,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 17,
          left: 17,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cuaca saat ini',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '10:30',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage('assets/img/dashboard/cuaca.png'),
                  height: 70,
                  width: 81,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '26°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 53,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Cuaca saat ini cocok untuk kamu melakukan Penyiangan pada tanaman mu!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
