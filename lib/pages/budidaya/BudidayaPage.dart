import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:variegata_project/pages/budidaya/Detail_Content.dart';


class BudidayaPage extends StatefulWidget {
  final int plantId;

  BudidayaPage({Key? key, required this.plantId}) : super(key: key);

  @override
  _BudidayaPageState createState() => _BudidayaPageState();
}

class _BudidayaPageState extends State<BudidayaPage> {
  Future<List<dynamic>> fetchBanners() async {
    final apiUrl = 'https://variegata.my.id/api/banners/plants/${widget.plantId}';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load banners');
    }
  }

  Future<List<dynamic>> fetchStages(int bannerId) async {
    final apiUrl = 'https://variegata.my.id/api/stages/banners/$bannerId';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stages');
    }
  }

  Future<List<dynamic>> fetchContents(int stageId) async {
    final apiUrl = 'https://variegata.my.id/api/contents/stages/$stageId';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load content');
    }
  }

  Future<void> _refreshBanners() async {
    // Panggil fungsi fetchBanners untuk memperbarui data dari API
    await fetchBanners();
    setState(() {});
  }

  Future<void> _refreshStages(int bannerId) async {
    // Panggil fungsi fetchStages untuk memperbarui data dari API
    await fetchStages(bannerId);
    setState(() {});
  }

  Future<void> _refreshContents(int stageId) async {
    // Panggil fungsi fetchContents untuk memperbarui data dari API
    await fetchContents(stageId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshBanners,
        child: FutureBuilder<List<dynamic>>(
          future: fetchBanners(),
          builder: (context, bannerSnapshot) {
            if (bannerSnapshot.connectionState == ConnectionState.waiting) {
              return Center();
            } else if (bannerSnapshot.hasError) {
              return Center(
                child: Text('Error loading banner data from API'),
              );
            } else if (!bannerSnapshot.hasData || bannerSnapshot.data!.isEmpty) {
              return Center(
                child: Text('No banner data available'),
              );
            } else {
              final bannerData = bannerSnapshot.data;
              return ListView.builder(
                itemCount: bannerData?.length,
                itemBuilder: (context, index) {
                  final banner = bannerData?[index];
                  final bannerId = banner['id'];
                  return Column(
                    children: [
                      Material(
                        elevation: 4,
                        color: Color(int.parse(banner['color'])),
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
                                    banner['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      banner['subtitle'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.network(
                                'https://variegata.my.id/storage/${banner['image']}',
                                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                width: 80,
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: () => _refreshStages(bannerId),
                        child: FutureBuilder<List<dynamic>>(
                          future: fetchStages(bannerId),
                          builder: (context, stageSnapshot) {
                            if (stageSnapshot.connectionState == ConnectionState.waiting) {
                              return Center();
                            } else if (stageSnapshot.hasError) {
                              return Center(
                                child: Text('Error loading stage data from API'),
                              );
                            } else if (!stageSnapshot.hasData || stageSnapshot.data!.isEmpty) {
                              return SizedBox(); // Return an empty widget if no stage data
                            } else {
                              final stages = stageSnapshot.data!;
                              return Column(
                                children: stages.map<Widget>((stage) {
                                  final stageId = stage['id'];
                                  final stageName = stage['name'];
                                  return Column(
                                    children: [
                                      // UI for stage
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(bottom: 10),
                                                    child: Text(
                                                      stageName,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 18,
                                                        fontFamily: 'Inter',
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
                                      RefreshIndicator(
                                        onRefresh: () => _refreshContents(stageId),
                                        child: FutureBuilder<List<dynamic>>(
                                          future: fetchContents(stageId),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return Center();
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                child: Text('Error loading data from API'),
                                              );
                                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                              return Center(
                                                child: Text('No data available'),
                                              );
                                            } else {
                                              final contents = snapshot.data!;
                                              if (contents.length == 1) {
                                                return ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: contents.length,
                                                  itemBuilder: (context, index) {
                                                    final content = contents[index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => ContentDetail(content: content),
                                                          ),
                                                        );
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          padding: EdgeInsets.all(16),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                child: Stack(
                                                                  children: [
                                                                    Image.network(
                                                                      'https://variegata.my.id/storage/${content['image']}',
                                                                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                                                      width: MediaQuery.of(context).size.width,
                                                                      height: 180,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                    Positioned(
                                                                      bottom: 0,
                                                                      child: Container(
                                                                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFFE3CA8A),
                                                                          borderRadius: BorderRadius.only(
                                                                            bottomLeft: Radius.circular(5),
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                          content['name'],
                                                                          style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 14,
                                                                            fontFamily: 'Inter',
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(vertical: 13),
                                                                child: Text(
                                                                  content['title'],
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 15,
                                                                    fontFamily: 'Inter',
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Klik lebih lanjut',
                                                                style: TextStyle(
                                                                  color: Color(0xFFBBD6B8),
                                                                  fontSize: 12,
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return GridView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                  ),
                                                  itemCount: contents.length,
                                                  itemBuilder: (context, index) {
                                                    final content = contents[index];
                                                    return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) => ContentDetail(content: content),
                                                          ),
                                                        );
                                                      },
                                                      child: Center(
                                                        child: Container(
                                                          width: 160,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                child: Stack(
                                                                  children: [
                                                                    Image.network(
                                                                      'https://variegata.my.id/storage/${content['image']}',
                                                                      errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                                                                      height: 100,
                                                                      fit: BoxFit.cover,
                                                                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                                                        return Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                          ),
                                                                          child: child,
                                                                        );
                                                                      },
                                                                    ),
                                                                    Positioned(
                                                                      bottom: 0,
                                                                      child: Container(
                                                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                                                        decoration: BoxDecoration(
                                                                          color: Color(0xFFE3CA8A),
                                                                          borderRadius: BorderRadius.only(
                                                                            bottomLeft: Radius.circular(5),
                                                                          ),
                                                                        ),
                                                                        child: Text(
                                                                          content['name'],
                                                                          style: TextStyle(
                                                                            color: Colors.black,
                                                                            fontSize: 12,
                                                                            fontFamily: 'Inter',
                                                                            fontWeight: FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets.symmetric(vertical: 10),
                                                                child: Text(
                                                                  content['title'],
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 12,
                                                                    fontFamily: 'Inter',
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                'Klik lebih lanjut',
                                                                style: TextStyle(
                                                                  color: Color(0xFFBBD6B8),
                                                                  fontSize: 12,
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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
