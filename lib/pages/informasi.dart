import 'package:flutter/material.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';
import 'package:variegata_project/common/widget/info_card.dart';
import 'package:variegata_project/pages/detail_informasi.dart';

class InformasiPage extends StatefulWidget {
  InformasiPage({Key? key}) : super(key: key);

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
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
                    BotNavbar(), // Ganti dengan halaman berikutnya
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        title: Text(
          'Informasi',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 25,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: Text(
                    'Temukan informasi terbaru seputar tanaman dan kebun',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 30,
                    bottom: 15,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 244,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/informasi-bg.png'),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Manfaat Bawang Merah yang Jarang Diketahui, Salah Satunya Bisa Bantu Cegah Diabetes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.asset(
                                  "assets/img/logo-mini.png",
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Variegata ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 4,
                                height: 4,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(),
                                ),
                              ),
                              Text(
                                'Apr 04, 2092',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hanya untuk kamu',
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Lihat Semua',
                            style: TextStyle(
                              color: Color(0xFF94AF9F),
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailInformasi(),
                        ));
                  },
                  child: CardInfo(
                    image: 'tomat.png',
                    title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                    kategori: 'Penyakit',
                  ),
                ),
                CardInfo(
                  image: 'tomat.png',
                  title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                  kategori: 'Penyakit',
                ),
                CardInfo(
                  image: 'tomat.png',
                  title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                  kategori: 'Penyakit',
                ),
                CardInfo(
                  image: 'tomat.png',
                  title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                  kategori: 'Penyakit',
                ),
                CardInfo(
                  image: 'tomat.png',
                  title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                  kategori: 'Penyakit',
                ),
                CardInfo(
                  image: 'tomat.png',
                  title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                  kategori: 'Penyakit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget CardInfo(String image, String title, String kategori) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               width: 48,
  //               height: 14,
  //               decoration: ShapeDecoration(
  //                 color: Color(0xFFE4E4E4),
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(9),
  //                 ),
  //               ),
  //               child: Center(
  //                 child: Text(
  //                   kategori.toString(),
  //                   style: TextStyle(
  //                     color: Color(0xFFB9B9B9),
  //                     fontSize: 8,
  //                     fontFamily: 'Inter',
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                   // textAlign: ,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 8,
  //             ),
  //             SizedBox(
  //               width: 184,
  //               child: Text(
  //                 title.toString(),
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12,
  //                   fontFamily: 'Inter',
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               height: 9,
  //             ),
  //             Row(
  //               children: [
  //                 Container(
  //                   padding: EdgeInsets.all(5),
  //                   width: 23,
  //                   height: 23,
  //                   decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(50)),
  //                   child: Image.asset(
  //                     "assets/img/logo-mini.png",
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 6,
  //                 ),
  //                 Text(
  //                   'Variegata ',
  //                   style: TextStyle(
  //                     color: Color(0xFFBABABA),
  //                     fontSize: 10,
  //                     fontFamily: 'Inter',
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: EdgeInsets.symmetric(horizontal: 10),
  //                   width: 4,
  //                   height: 4,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(50),
  //                     color: Color(0xFFBABABA),
  //                   ),
  //                 ),
  //                 Text(
  //                   'Apr 04, 2092',
  //                   style: TextStyle(
  //                     color: Color(0xFFBABABA),
  //                     fontSize: 10,
  //                     fontFamily: 'Inter',
  //                     fontWeight: FontWeight.w500,
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ],
  //         ),
  //         Container(
  //           width: 84,
  //           height: 84,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.grey.withOpacity(0.5), // Warna shadow
  //                 spreadRadius: 2, // Jarak penyebaran shadow
  //                 blurRadius: 5, // Radius blur shadow
  //                 offset: Offset(0, 2), // Offset atau posisi shadow
  //               ),
  //             ],
  //             image: DecorationImage(
  //               image: AssetImage(
  //                 'assets/img/$image',
  //               ),
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
