import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:variegata_project/pages/informasi/detail_informasi.dart';

import '../../common/widget/bottom_navbar.dart';

class Informasi extends StatefulWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  String apiUrl =
      'https://variegata.my.id/api/informasis'; // Ganti dengan URL Anda

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    BotNavbar(), // Ganti dengan halaman berikutnya
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        title: Text(
          'Informasi',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder<List<dynamic>>(
          future: fetchProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = snapshot.data![index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailInformasi(product: product),
                            ),
                          );
                        },
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
                                      'Penyakit',
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
                                    product['name'],
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
                                          borderRadius:
                                              BorderRadius.circular(50)),
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: 4,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xFFBABABA),
                                      ),
                                    ),
                                    Text(
                                      'Apr 04, 2023',
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
                              padding: EdgeInsets.all(10.0),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0.3,
                                    blurRadius: 20,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://variegata.my.id/storage/${product['image']}',
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  alignment: Alignment.topCenter,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
