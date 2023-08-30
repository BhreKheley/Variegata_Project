import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../common/widget/bottom_navbar.dart';
import 'Detail_Budidaya.dart';

class Budidaya extends StatefulWidget {
  const Budidaya({Key? key}) : super(key: key);

  @override
  State<Budidaya> createState() => _BudidayaState();
}

class _BudidayaState extends State<Budidaya> {
  String apiUrl = 'https://variegata.my.id/api/plants'; // Ganti dengan URL Anda

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
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        title: const Text(
          "Budidaya",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF33363F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BotNavbar()),
            );
          },
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return const Text('No data available');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final product = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPlant(product: product),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    color: const Color(0xFFF6F7FA),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      'https://variegata.my.id/storage/${product['image']}',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error)),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  product['scientific'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)
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
