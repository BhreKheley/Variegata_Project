import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:variegata_project/pages/budidaya_page.dart';
import 'package:variegata_project/pages/hama_penyakit.dart';
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
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        //PEMBENIHAN
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pembenihan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 25),
                              Image(
                                image: AssetImage("assets/img/pembenihan.png"),
                              ),
                              SizedBox(height: 25),
                              ReadMoreText(
                                "1. Siapkan biji cabai yang berkualitas dan bebas dari penyakit.\n"
                                "2. Persiapkan media tanam yang cocok, seperti pot atau bedengan dengan campuran tanah dan kompos yang subur.\n"
                                "3. Benamkan biji cabai di dalam media tanam dengan kedalaman sekitar 1-2 cm.\n"
                                "4. Berikan penyiraman yang cukup agar media tetap lembab. \n\n",
                                trimLines: 5,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Baca lebih lanjut",
                                trimExpandedText: "Lihat lebih sedikit",
                                colorClickableText: Color(0xFFBBD6B8),
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Dash(
                          direction: Axis.horizontal,
                          length: 380,
                          dashLength: 6,
                          dashColor: Color(0xFFE3E3E3),
                          dashThickness: 2,
                          dashGap: 6,
                        ),
                        //PENYEMAIAN
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penyemaian",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 25),
                              Image(
                                image: AssetImage("assets/img/penyemaian.png"),
                              ),
                              SizedBox(height: 25),
                              ReadMoreText(
                                "1. Tempatkan wadah penyemaian di tempat yang terkena sinar matahari cukup.\n"
                                "2. Jaga kelembaban media dengan penyiraman yang teratur.\n"
                                "3. Setelah bibit cabai muncul, pastikan mereka mendapatkan cahaya yang cukup dan suhu yang hangat.\n"
                                "4. Setelah bibit cabai muncul, pastikan mereka mendapatkan cahaya yang cukup dan suhu yang hangat. \n\n",
                                trimLines: 5,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Baca lebih lanjut",
                                trimExpandedText: "Lihat lebih sedikit",
                                colorClickableText: Color(0xFFBBD6B8),
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Dash(
                          direction: Axis.horizontal,
                          length: 380,
                          dashLength: 6,
                          dashColor: Color(0xFFE3E3E3),
                          dashThickness: 2,
                          dashGap: 6,
                        ),
                        //PENANAMAN
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Penanaman",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 25),
                              Image(
                                image: AssetImage("assets/img/penanaman.png"),
                              ),
                              SizedBox(height: 25),
                              ReadMoreText(
                                "1. Pilih lokasi penanaman yang mendapatkan sinar matahari penuh dan memiliki drainase yang baik.\n"
                                "2. Siapkan lubang tanam dengan jarak yang sesuai antara tanaman cabai.\n"
                                "3. Pindahkan bibit cabai dengan hati-hati ke lubang tanam.\n"
                                "4. Ratakan tanah di sekitar tanaman dan beri penyiraman setelah penanaman. \n\n",
                                trimLines: 5,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Baca lebih lanjut",
                                trimExpandedText: "Lihat lebih sedikit",
                                colorClickableText: Color(0xFFBBD6B8),
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Dash(
                          direction: Axis.horizontal,
                          length: 380,
                          dashLength: 6,
                          dashColor: Color(0xFFE3E3E3),
                          dashThickness: 2,
                          dashGap: 6,
                        ),
                        //PERAWATAN
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Perawatan",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 25),
                              Image(
                                image: AssetImage("assets/img/perawatan.png"),
                              ),
                              SizedBox(height: 25),
                              ReadMoreText(
                                "1. Lakukan penyiraman secara teratur untuk menjaga kelembaban tanah, terutama saat tanaman masih muda.\n"
                                "2. Berikan pupuk yang sesuai, seperti pupuk organik atau pupuk khusus untuk tanaman cabai.\n"
                                "3. Periksa dan atasi hama atau penyakit yang mungkin menyerang tanaman, seperti ulat, kutu, atau penyakit layu.\n"
                                "4. Jaga kebersihan area penanaman dengan membersihkan gulma dan membuang daun atau ranting yang sudah mati. \n\n",
                                trimLines: 5,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Baca lebih lanjut",
                                trimExpandedText: "Lihat lebih sedikit",
                                colorClickableText: Color(0xFFBBD6B8),
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Dash(
                          direction: Axis.horizontal,
                          length: 380,
                          dashLength: 6,
                          dashColor: Color(0xFFE3E3E3),
                          dashThickness: 2,
                          dashGap: 6,
                        ),
                        //PANEN
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            top: 25,
                            right: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Panen",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 23,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 25),
                              Image(
                                image: AssetImage("assets/img/panen.png"),
                              ),
                              SizedBox(height: 25),
                              ReadMoreText(
                                "1. Biasanya, cabai siap panen dalam waktu 2-3 bulan setelah penanaman, tergantung pada varietasnya.\n"
                                "2. Panen cabai saat sudah mencapai ukuran yang diinginkan dan warnanya telah matang.\n"
                                "3. Gunakan pisau atau gunting tajam untuk memotong cabai dengan tangkainya.\n"
                                "4. Jangan lupa untuk menjaga kebersihan tangan saat memanen dan menyimpan cabai dalam kondisi yang baik. \n\n",
                                trimLines: 5,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: "Baca lebih lanjut",
                                trimExpandedText: "Lihat lebih sedikit",
                                colorClickableText: Color(0xFFBBD6B8),
                                style: TextStyle(
                                  color: Color(0xFF585858),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Dash(
                          direction: Axis.horizontal,
                          length: 380,
                          dashLength: 6,
                          dashColor: Color(0xFFE3E3E3),
                          dashThickness: 2,
                          dashGap: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                HamaPenyakit(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
