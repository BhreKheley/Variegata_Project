import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:variegata_project/pages/hama_penyakit.dart';

import 'budidaya_page.dart';

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
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 0,
        title: const Text(
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
                  child: const Image(
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
                        margin: const EdgeInsets.only(right: 10),
                        width: 78,
                        height: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Image(
                            image: AssetImage('assets/img/cabai.png')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Column(
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
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          elevation: 4, // Atur nilai elevation sesuai kebutuhan
                          color: const Color(0xFFDCDEE4),
                          child: Container(
                            width: 395,
                            height: 139,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 25,
                                        bottom: 15,
                                      ),
                                      child: Text(
                                        "Tahap Prapembibitan",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "4 Minggu sebelum \n pembibitan",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Image(
                                  image: AssetImage(
                                      "assets/img/budidaya/prapembibitan.png"),
                                  width: 84,
                                  height: 84,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "4 Minggu sebelum pembibitan",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "3 Minggu sebelum pembibitan",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "2 Minggu sebelum pembibitan",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              ContentShort()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "1 Minggu sebelum pembibitan",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 395,
                              height: 10,
                              color: Color(0xFFF1F1F1),
                            ),
                            Material(
                              elevation:
                                  4, // Atur nilai elevation sesuai kebutuhan
                              color: const Color(0xFFFFC672),
                              child: Container(
                                width: 395,
                                height: 139,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            "Tahap Pembibitan",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Minggu 1 - 3",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/img/budidaya/tahap-pembibitan.png"),
                                      width: 84,
                                      height: 84,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 1",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 2",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 3",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              ContentShort()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 395,
                              height: 10,
                              color: Color(0xFFF1F1F1),
                            ),
                            Material(
                              elevation:
                                  4, // Atur nilai elevation sesuai kebutuhan
                              color: const Color(0xFFFF9494),
                              child: Container(
                                width: 395,
                                height: 139,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            "Tahap Vegetatif",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Minggu 4 - 12",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/img/budidaya/tahap-vegetatif.png"),
                                      width: 84,
                                      height: 84,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 4",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 5",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 6",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 7",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 8",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 9",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 10",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 11",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 12",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 395,
                              height: 10,
                              color: Color(0xFFF1F1F1),
                            ),
                            Material(
                              elevation:
                                  4, // Atur nilai elevation sesuai kebutuhan
                              color: const Color(0xFFA5DFFF),
                              child: Container(
                                width: 395,
                                height: 139,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            "Tahap Berbunga",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Minggu 13 - 15",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/img/budidaya/tahap-berbunga.png"),
                                      width: 84,
                                      height: 84,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 13",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 14 - 15",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 395,
                              height: 10,
                              color: Color(0xFFF1F1F1),
                            ),
                            Material(
                              elevation:
                                  4, // Atur nilai elevation sesuai kebutuhan
                              color: const Color(0xFFFFF6A5),
                              child: Container(
                                width: 395,
                                height: 139,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            "Tahap Berbunga",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Minggu 16 - 18",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/img/budidaya/tahap-berbuah.png"),
                                      width: 84,
                                      height: 84,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 16",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 17",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 340,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 18",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 395,
                              height: 10,
                              color: Color(0xFFF1F1F1),
                            ),
                            Material(
                              elevation:
                                  4, // Atur nilai elevation sesuai kebutuhan
                              color: const Color(0xFFDDFFA5),
                              child: Container(
                                width: 395,
                                height: 139,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 25,
                                            bottom: 15,
                                          ),
                                          child: Text(
                                            "Tahap Panen",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Minggu 19 - 22",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/img/budidaya/tahap-panen.png"),
                                      width: 84,
                                      height: 84,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 19",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ContentLength(),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 332,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Text(
                            "Minggu 20",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ContentShort(),
                                  ContentShort(),
                                ],
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              ContentShort(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Dash(
                            direction: Axis.horizontal,
                            length: 340,
                            dashLength: 6,
                            dashThickness: 2,
                            dashColor: Color(0xFFE3E3E3),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Minggu 21 - 22",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: Text(
                            "Tidak ada tugas pada minggu ini",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const HamaPenyakit(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ContentShort() {
    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: const Image(
                  image: AssetImage("assets/img/budidaya/activity-1.png"),
                  width: 150,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  // Properti dan styling untuk Container yang menimpa gambar
                  width: 115,
                  height: 20,
                  decoration: const BoxDecoration(
                      color: Color(0xFFE3CA8A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3))),
                  child: const Center(
                    child: Text(
                      "Pelatihan tanaman",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Persiapan lahan primer dengan cepat",
            style: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Klik lebih lanjut",
            style: TextStyle(
              fontSize: 19,
              color: Color(0xFFBBD6B8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget ContentLength() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: const Image(
                    image: AssetImage("assets/img/budidaya/pertumbuhan.png"),
                    width: 350,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    // Properti dan styling untuk Container yang menimpa gambar
                    width: 115,
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Color(0xFFE3CA8A),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(3),
                            bottomLeft: Radius.circular(3))),
                    child: const Center(
                      child: Text(
                        "Pelatihan tanaman",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Jarangkan bibit untuk hasilkan tegakan tanaman yang sehat",
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "Klik lebih lanjut",
              style: TextStyle(
                fontSize: 19,
                color: Color(0xFFBBD6B8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
