import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:variegata_project/pages/budidaya/HamaPenyakit.dart';
import 'package:variegata_project/pages/budidaya/budidaya_tab.dart';

class DetailPlant extends StatefulWidget {
  final dynamic product;
  DetailPlant({required this.product});

  @override
  _DetailPlantState createState() => _DetailPlantState();
}

class _DetailPlantState extends State<DetailPlant>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = [
    'Budidaya',
    'Hama & Penyakit',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTab({String? title, bool? isActive}) {
    return Container(
      height: 50,
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:
                isActive! ? const Color(0xFF94AF9F) : const Color(0xFFDADADA),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FA),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          color: Colors.black,
        ),
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 118,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://variegata.my.id/storage/${widget.product['image_bg']}',
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 103,
                  left: 20,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://variegata.my.id/storage/${widget.product['image']}',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product['name'],
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.product['scientific'],
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 88,
          ),
          Container(
            height: 50,
            decoration:
                BoxDecoration(color: const Color(0xFFF6F7FA), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Warna shadow
                spreadRadius: -4, // Jarak penyebaran shadow
                blurRadius: 15, // Radius blur shadow
                offset: const Offset(0, 3),
              ),
            ]),
            child: TabBar(
              controller: _tabController,
              indicator: const UnderlineTabIndicator(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                borderSide: BorderSide(
                  width: 3,
                  color: Color(0xFF94AF9F),
                ),
                insets: EdgeInsets.symmetric(horizontal: 52.5),
              ),
              tabs: tabs.map((String title) {
                return _buildTab(
                  title: title,
                  isActive: _tabController.index == tabs.indexOf(title),
                );
              }).toList(),
              onTap: (index) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BudidayaTab(),
                HamaPenyakit(plantId: widget.product['id']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
