import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:variegata_project/pages/budidaya/Stage.dart';

class PageBanner extends StatelessWidget {

  final int plantId;
  PageBanner({Key? key, required this.plantId}) : super(key: key);

  Future<List<dynamic>> fetchProducts() async {
    final apiUrl = 'https://variegata.my.id/api/banners/plants/$plantId';
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
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data from API'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            return Column(
              children: [
                ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final product = snapshot.data?[index];
                    return Material(
                      elevation: 4,
                      color: Color(int.parse(product['color'])),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product['name'], // Adjust this to the API response structure
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 193,
                                  child: Text(
                                    product['subtitle'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 21,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CachedNetworkImage(
                              imageUrl: 'https://variegata.my.id/storage/${product['image']}', // Adjust this to the API response structure
                              placeholder: (context, url) => CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                              width: 80,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: Stage(bannerId: plantId)),
              ],
            );
          }
        },
      ),
    );
  }
}
