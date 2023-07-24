import "package:flutter/material.dart";
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'package:variegata_project/common/widget/product_card.dart';
import 'package:variegata_project/pages/catalog_shop/alat_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/benih_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/pestisida_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/pupuk_catalog.dart';
import 'package:variegata_project/pages/catalog_shop/tanaman_catalog.dart';
import '../../common/widget/iklan_carousel.dart';
import '../../common/widget/search_box.dart';

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
        title: Text(
          "Toko Variegata",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Search_box()),
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:
                                Image.asset('assets/img/katalog_tanaman.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Tanaman",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/img/katalog_benih.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Benih",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/img/katalog_pupuk.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pupuk",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child:
                                Image.asset('assets/img/katalog_pestisida.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Pestisida",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 48,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset('assets/img/katalog_alat.png'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Alat",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rekomendasi untuk kamu',
                        style: TextStyle(
                          color: Color(0xFF505050),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Lihat Semua',
                        style: TextStyle(
                          color: Color(0xFF94AF9F),
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ProductCard(
                              image: 'pupuk_merah.png',
                              title:
                                  'Pupuk NPK phonska plus 15-15-15 kemasan pabrik 25kg',
                              price: 'Rp459.000',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ProductCard(
                              image: 'fullset_alat.png',
                              title:
                                  'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                              price: 'Rp59.000',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ProductCard(
                              image: 'pupuk_merah.png',
                              title:
                                  'Pupuk NPK phonska plus 15-15-15 kemasan pabrik 25kg',
                              price: 'Rp459.000',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ProductCard(
                              image: 'fullset_alat.png',
                              title:
                                  'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                              price: 'Rp59.000',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: ProductCard(
                              image: 'benih_tomat.png',
                              title:
                                  '(1 Pack) Benih buah tomat unggul WARANI F1',
                              price: 'Rp17.000',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
