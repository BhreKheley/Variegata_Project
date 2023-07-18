import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:variegata_project/pages/budidaya_page.dart';
import 'package:variegata_project/pages/budidaya_tab.dart';
import 'package:variegata_project/pages/hama_penyakit_tab.dart';
import 'package:flutter_dash/flutter_dash.dart';

class DetailBudidaya extends StatefulWidget {
  @override
  _DetailBudidayaState createState() => _DetailBudidayaState();
}

class _DetailBudidayaState extends State<DetailBudidaya>
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
            color: isActive! ? Color(0xFF94AF9F) : Color(0xFFDADADA),
          ),
        ),
      ),
    );
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
                    BudidayaPage(), // Ganti dengan halaman berikutnya
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 0,
        title: Text(
          'Cabai',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage('assets/img/bg-cabai.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Image(image: AssetImage('assets/img/cabai.png')),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cabai',
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Capsicum annum',
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
          SizedBox(
            height: 88,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(color: Color(0xFFF6F7FA), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Warna shadow
                spreadRadius: -4, // Jarak penyebaran shadow
                blurRadius: 15, // Radius blur shadow
                offset: Offset(0, 3),
              ),
            ]),
            child: TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
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
                HamaPenyakit(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
