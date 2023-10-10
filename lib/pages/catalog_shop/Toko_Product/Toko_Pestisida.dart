import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'Detail_Toko.dart';

class ShopPestisida extends StatefulWidget {
  const ShopPestisida({Key? key}) : super(key: key);

  @override
  State<ShopPestisida> createState() => _ShopPestisidaState();
}

class _ShopPestisidaState extends State<ShopPestisida> {
  String apiUrl = 'https://variegata.my.id/api/products/category/4';
  bool isLoading = true;

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Widget _buildShimmerProductCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Pestisida",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.62,
              ),
              padding: EdgeInsets.all(20.0),
              shrinkWrap: true,
              itemCount: snapshot.data?.length ?? 10,
              itemBuilder: (BuildContext context, int index) {
                return _buildShimmerProductCard();
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available');
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  fetchProducts();
                });
              },
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: 0.62,
                ),
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(20.0),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = snapshot.data![index];
                  return Container(
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
                              'https://variegata.my.id/storage/${product['image']}',
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
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
                                Text(product['name'],
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
                                Text('\Rp.${product['price']}',
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
              ),
            );
          }
        },
      ),
    );
  }
}
