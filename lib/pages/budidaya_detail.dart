import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variegata_project/pages/budidaya_page.dart';
import 'package:variegata_project/pages/hama_penyakit.dart';

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
                Center(child: Text('Tab 1 Content')),
                HamaPenyakit(),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                //   child: Column(
                //     children: [
                //       Container(
                //         padding: EdgeInsets.only(bottom: 20),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "Daftar Hama & Penyakit",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 20,
                //                 fontFamily: "Inter",
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //             SizedBox(
                //               height: 15,
                //             ),
                //             Text(
                //               "Tanaman rentan terhadap serangan hama dan penyakit yang dapat mengancam pertumbuhan dan hasil panen.",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 14,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Container(
                //         padding: EdgeInsets.symmetric(vertical: 10),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Row(
                //               children: [
                //                 Container(
                //                   width: 86,
                //                   height: 79,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5),
                //                     boxShadow: [
                //                       BoxShadow(
                //                         color: Colors.grey
                //                             .withOpacity(0.5), // Warna shadow
                //                         spreadRadius:
                //                             2, // Jarak penyebaran shadow
                //                         blurRadius: 5, // Radius blur shadow
                //                         offset: Offset(
                //                             0, 2), // Offset atau posisi shadow
                //                       ),
                //                     ],
                //                     image: DecorationImage(
                //                       image: AssetImage(
                //                           'assets/img/hama.png'), // Path atau asset gambar
                //                       fit: BoxFit.cover,
                //                     ),
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.symmetric(horizontal: 11),
                //                   width: 2,
                //                   height: 57,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(8),
                //                     color: Color(0xFFDEDEDE),
                //                   ),
                //                 ),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       "Kutu Daun",
                //                       style: TextStyle(
                //                         color: Colors.black,
                //                         fontSize: 16,
                //                         fontFamily: "Inter",
                //                         fontWeight: FontWeight.w600,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height: 8,
                //                     ),
                //                     Text(
                //                       "Aphids",
                //                       style: TextStyle(
                //                         color: Colors.black,
                //                         fontSize: 14,
                //                         fontStyle: FontStyle.italic,
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height: 8,
                //                     ),
                //                     Row(
                //                       children: [
                //                         Container(
                //                           width: 18,
                //                           height: 18,
                //                           child: Image(
                //                             image: AssetImage(
                //                                 'assets/img/hama_icon.png'),
                //                           ),
                //                         ),
                //                         SizedBox(
                //                           width: 5,
                //                         ),
                //                         Text(
                //                           "Hama",
                //                           style: TextStyle(
                //                             color: Color(0xff7f7f7f),
                //                             fontSize: 15,
                //                           ),
                //                         ),
                //                       ],
                //                     )
                //                   ],
                //                 ),
                //               ],
                //             ),
                //             Icon(
                //               Icons.arrow_forward_ios,
                //               size: 30,
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
