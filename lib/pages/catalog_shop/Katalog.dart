import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:variegata_project/pages/catalog_shop/Toko_Product/Detail_Toko.dart';

class Katalog extends StatefulWidget {
  const Katalog({Key? key}) : super(key: key);

  @override
  _KatalogState createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  final String url = 'https://variegata.my.id/api/products';

  Future<List<dynamic>> getProducts() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<List<dynamic>>(
        future: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading indicator
          } else if (snapshot.hasError) {
            return Text('Data error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No data available.');
          } else {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var product = snapshot.data![index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProduk(product: product),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(5),
                                ),
                                child: Image.network(
                                  product['image'],
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
                                      product['price'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Color(0xFFBBD6B8),
                                          size: 15,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          'Kudus',
                                          style: TextStyle(
                                            color: Color(0xFFADADAD),
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                          ),
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
                                            fontWeight: FontWeight.w600,
                                          ),
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
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
