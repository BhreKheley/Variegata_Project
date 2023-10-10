import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'dart:convert';
import 'Detail_Budidaya.dart';

class Budidaya extends StatefulWidget {
  const Budidaya({Key? key}) : super(key: key);

  @override
  State<Budidaya> createState() => _BudidayaState();
}

class _BudidayaState extends State<Budidaya> {
  String apiUrl = 'https://variegata.my.id/api/plants';
  bool isLoading = true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<void> refreshData() async {
    await fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      return json.decode(response.body);
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load products');
    }
  }

  Widget _buildShimmerPlantCard() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.only(bottom: 2),
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: Color(0xFFF6F7FA),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 15,
                      color: Colors.white,
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 100,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text(
          "Budidaya",
          style: GoogleFonts.notoSerif(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => BotNavbar()),
            );
          },
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: refreshData,
        child: FutureBuilder<List<dynamic>>(
          future: fetchProducts(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(), // Ini memungkinkan untuk menarik ke bawah untuk merefresh
                itemCount: snapshot.data?.length ?? 8, // Jumlah placeholder shimmer
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data == null || index >= snapshot.data!.length) {
                    return _buildShimmerPlantCard();
                  } else {
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
                        margin: EdgeInsets.only(bottom: 2),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        color: Color(0xFFF6F7FA),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 45,
                                  margin: EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: Image.network(
                                    'https://variegata.my.id/storage/${product['image']}',
                                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product['name'],
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    );
                  }
                },
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
                      margin: EdgeInsets.only(bottom: 2),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Color(0xFFF6F7FA),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                margin: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Image.network(
                                  'https://variegata.my.id/storage/${product['image']}',
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    }
                                  },
                                  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'],
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
