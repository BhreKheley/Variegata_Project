import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 302,
      decoration: BoxDecoration(
        color: Color(0xFFDBE4C6),
        image: DecorationImage(
          image: AssetImage('assets/img/dashboard/bg-daun.png'),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Text(
              'Belanja Kebutuhan Lahan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Lengkap, terjamin asli, dan mudah.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Products(
                  'pestisida.png',
                  'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                  'Rp50.000',
                ),
                Products(
                  'bibit.png',
                  '(1 Pack) Benih buah tomat unggul WARANI F1',
                  'Rp15.000',
                ),
                Products(
                  'alat.png',
                  'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                  'Rp15.000',
                ),
              ],
            ),
            Spacer(),
            Text(
              'Lihat Semua',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationThickness: 2.0,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Products(String image, String title, String price) {
    return Container(
      child: Container(
        width: 98,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(5),
              ),
              child: Image(
                image: AssetImage('assets/img/dashboard/$image'),
                alignment: Alignment.topCenter,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Container(
              width: 98,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFBBD6B8),
                        size: 10,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Kudus',
                        style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 9,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFC400),
                        size: 10,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '4.9 | Terjual 14',
                        style: TextStyle(
                            color: Color(0xFFADADAD),
                            fontSize: 9,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Color(0xFFADADAD),
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
