import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/auth/register_page.dart';
import 'package:variegata_project/main.dart';
import 'package:variegata_project/pages/dashboard/artikel.dart';
import 'package:variegata_project/pages/dashboard/iklan_carousel.dart';
import 'package:variegata_project/pages/dashboard/cuaca.dart';
import 'package:variegata_project/pages/dashboard/product.dart';
import 'package:variegata_project/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:variegata_project/pages/dashboard/search_box.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF94AF9F),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 37),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/logo.svg'),
                              Text(
                                "Variegata",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Search_box(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/img/budidaya.png'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Budidaya",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:
                                        Image.asset('assets/img/informasi.png'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Informasi",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Image.asset('assets/img/toko.png'),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Toko",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 90,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -124,
                    right: 20,
                    left: 20,
                    child: Cuaca(),
                  ),
                ],
              ),
              SizedBox(
                height: 157,
              ),
              Iklan_carousel(),
              SizedBox(
                height: 33,
              ),
              Product(),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Konten menarik untuk kamu',
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
              Artikel_carousel(),
            ],
          ),
        ),
      ),
    );
  }
}
