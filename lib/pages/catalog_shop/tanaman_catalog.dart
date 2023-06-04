import 'package:flutter/material.dart';
import 'package:variegata_project/pages/catalog_shop/produk_catalog.dart';
// import 'package:variegata_project/pages/detail_page.dart';

import '../../common/widget/product_card.dart';
import 'dashboard_catalog.dart';

class ShopTanaman extends StatefulWidget {
  const ShopTanaman({super.key});

  @override
  State<ShopTanaman> createState() => _ShopTanamanState();
}

class _ShopTanamanState extends State<ShopTanaman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Tanaman",
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
              MaterialPageRoute(builder: (context) => KatalogShop()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        // child: GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => DetailPage()),
        //     );
        //   },
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom dalam grid
                mainAxisSpacing: 20.0, // Jarak antara baris
                crossAxisSpacing: 20.0, // Jarak antara kolom
                childAspectRatio: 0.62, // Rasio lebar-tinggi item dalam grid
              ),
              padding: EdgeInsets.all(20.0), // Padding di sekitar grid
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20, // Jumlah total item dalam grid
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -4,
                        blurRadius: 14,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailProduk(),
                        ),
                      );
                    },
                    child: ProductCard(
                      image: 'antasoma.png',
                      title:
                          'Tanaman Hias Antasoma (Caladium Xanthosoma Lindeni) Anakan',
                      price: 'Rp105.000',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      // ),
    );
  }
}
