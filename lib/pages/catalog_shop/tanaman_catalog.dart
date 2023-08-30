import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:variegata_project/pages/catalog_shop/dashboard_catalog.dart';
import 'dart:convert';

import 'Detail_Toko.dart';

class ShopTanaman extends StatefulWidget {
  const ShopTanaman({Key? key}) : super(key: key);

  @override
  State<ShopTanaman> createState() => _ShopTanamanState();
}

class _ShopTanamanState extends State<ShopTanaman> {
  String apiUrl =
      'https://variegata.my.id/api/products/category/1'; // Ganti dengan URL Anda

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  String formatPrice(String price) {
    // Ubah string harga menjadi tipe double
    double parsedPrice = double.tryParse(price) ?? 0.0;

    // Format angka dengan tanda pemisah ribuan dan simbol mata uang
    String formattedPrice = 'Rp ' +
        parsedPrice.toStringAsFixed(0).replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (Match m) => '${m[1]}.',
            );

    return formattedPrice;
  }

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
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available');
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom dalam grid
                mainAxisSpacing: 20.0, // Jarak antara baris
                crossAxisSpacing: 20.0, // Jarak antara kolom
                childAspectRatio: 0.62, // Rasio lebar-tinggi item dalam grid
              ),
              padding: EdgeInsets.all(20.0), // Padding di sekitar grid
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduk(product: product),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 231,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -4,
                          blurRadius: 14,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(5),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://variegata.my.id/storage/${product['image']}',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            alignment: Alignment.topCenter,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 110,
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['name'],
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                '${formatPrice(product['price'])}',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 9,
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
                                    '4.9 | Belum Terjual',
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
              },
            );
          }
        },
      ),
    );
  }
}
