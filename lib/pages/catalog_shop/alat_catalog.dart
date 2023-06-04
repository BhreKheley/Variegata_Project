import 'package:flutter/material.dart';

import '../../common/widget/product_card.dart';
import 'dashboard_catalog.dart';

class ShopAlat extends StatefulWidget {
  const ShopAlat({super.key});

  @override
  State<ShopAlat> createState() => _ShopAlatState();
}

class _ShopAlatState extends State<ShopAlat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Alat",
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
                  child: ProductCard(
                    image: 'fullset_alat.png',
                    title:
                        'Alat berkebun menanam cangkul sekop tanah tanaman hobi cocok tanam',
                    price: 'Rp59.000',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
