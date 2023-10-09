import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:variegata_project/pages/informasi/detail_informasi.dart';

class Artikel_carousel extends StatefulWidget {
  Artikel_carousel({Key? key}) : super(key: key);

  @override
  State<Artikel_carousel> createState() => _Artikel_carouselState();
}

class _Artikel_carouselState extends State<Artikel_carousel> {
  List<Map<String, dynamic>> data = [];

  Future<void> fetchProducts() async {
    final response =
    await http.get(Uri.parse('https://variegata.my.id/api/informasis'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        data = responseData.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          final product = data[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailInformasi(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 220,
              height: 180,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 14,
                          offset: Offset(0, 5),
                        ),
                      ],
                      color: const Color(0xffd9d9d9),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 220,
                              height: 130,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 220,
                                        height: 130,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                          ),
                                          child: Image.network(
                                            'https://variegata.my.id/storage/${product['image']}',
                                            errorBuilder: (context, error, stackTrace) {
                                              return Icon(Icons.error);
                                            },
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 160,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                              ),
                                          color: const Color(0xcc94af9f),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              width: 220,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 37,
                          child: SizedBox(
                            width: 140,
                            child: Text(
                              product['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 140,
                          child: SizedBox(
                            width: 200,
                            child: Center(
                              child: Text(
                                product['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 30,
                          top: 95,
                          child: Text(
                            "Variegata",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 95,
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: SvgPicture.asset('assets/img/logo.svg'),
                          ),
                        ),
                        Positioned(
                          left: 6,
                          top: 10,
                          child: Container(
                            width: 16,
                            height: 16,
                            child: const Image(
                              image: AssetImage(
                                'assets/img/info-logo.png',
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 23,
                          top: 15,
                          child: Text(
                            "InVarita",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
