import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:variegata_project/pages/profile/profile_page.dart';

import 'detail_pemesanan.dart';

class RiwayatPembelian extends StatefulWidget {
  const RiwayatPembelian({super.key});

  @override
  State<RiwayatPembelian> createState() => _RiwayatPembelianState();
}

class _RiwayatPembelianState extends State<RiwayatPembelian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Riwayat Pembelian",
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
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Container(
                width: 355,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Color(0xFFD9D9D9),
                      width: 1.0,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 10, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/img/profile/status-pemesanan.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Status Pemesanan",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 19,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF505050),
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPemesanan()));
              },
              child: Container(
                width: 355,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFDBDBDB),
                        offset: Offset(0, 0),
                        blurRadius: 9,
                        spreadRadius: -4,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, top: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            'assets/img/profile/icon-produk.png',
                            width: 32,
                            height: 32,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Belanja",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "29 Agustus 2023",
                                      style: TextStyle(
                                        color: Color(0xFFADADAD),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  width: 84,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE2F4E9),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Center(
                                    child: Text(
                                      "Selesai",
                                      style: TextStyle(
                                          color: Color(0xFF458A61),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFD9D9D9),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image(
                              image: AssetImage(
                                  "assets/img/produk-philodendron.png"),
                              width: 47,
                              height: 47,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 260,
                                  child: Text(
                                    'Tanaman Philodendron Monstera Deliciosa',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  '1 barang',
                                  style: TextStyle(
                                    color: Color(0xFFADADAD),
                                    fontSize: 13,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Belanja",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Rp150.000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Container(
                            width: 102,
                            height: 31,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(color: Color(0xFF9ED098))),
                            child: Center(
                              child: Text(
                                "Beli Lagi",
                                style: TextStyle(
                                    color: Color(0xFF9ED098),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
