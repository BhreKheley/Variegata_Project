import "package:flutter/material.dart";
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'package:variegata_project/common/widget/iklan_carousel.dart';
import 'package:variegata_project/pages/catalog_shop/Keranjang/cart.dart';
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Toko_Alat.dart';
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Toko_Benih.dart';
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Toko_Pestisida.dart';
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Toko_Pupuk.dart';
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Toko_Tanaman.dart';


class KatalogShop extends StatefulWidget {
  const KatalogShop({super.key});

  @override
  State<KatalogShop> createState() => _KatalogShopState();
}

class _KatalogShopState extends State<KatalogShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BotNavbar(),
              ),
            );
          },
        ),
        title: Text(
          "Toko Variegata",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            color: Color(0xFF33363F),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    // child: Search_box()
                ),
                Iklan_carousel(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopTanaman(),
                            ));
                      },
                      child: katalog(
                        'katalog_tanaman.png',
                        'Tanaman',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopBenih(),
                            ));
                      },
                      child: katalog(
                        'katalog_benih.png',
                        'Benih',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopPupuk(),
                            ));
                      },
                      child: katalog(
                        'katalog_pupuk.png',
                        'Pupuk',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopPestisida(),
                            ));
                      },
                      child: katalog(
                        'katalog_pestisida.png',
                        'Pestisida',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopAlat(),
                            ));
                      },
                      child: katalog(
                        'katalog_alat.png',
                        'Alat',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 211,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/promo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Products(
                          'pestisida.png',
                          'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                          'Rp50.000',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Products(
                          'pestisida.png',
                          'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                          'Rp50.000',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 99,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: AssetImage('assets/img/bg-ktg1.png'),
                                fit: BoxFit.cover),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Toko Variegata',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Cari Kebutuhan Berkebun mu\ndengan cara yang mudah',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Products(
                              'pestisida.png',
                              'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                              'Rp50.000',
                            ),
                            Products(
                              'pestisida.png',
                              'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                              'Rp50.000',
                            ),
                            Products(
                              'pestisida.png',
                              'Pestisida Organik Cair untuk tanaman padi dan palawijaya BIOSIDA',
                              'Rp50.000',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Products(String image, String title, String price) {
    return Container(
      child: Container(
        width: 98,
        height: 193,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8), // Shadow color
              spreadRadius:
                  0, // How far the shadow should spread from the Container
              blurRadius: 4, // The intensity of the blur effect
              offset: Offset(1, 1), // Offset of the shadow from the Container
            ),
          ],
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

  Widget katalog(String image, String title) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 48,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.asset('assets/img/$image'),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
