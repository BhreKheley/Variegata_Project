// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:variegata_project/pages/catalog_shop/wishlist.dart';
import 'package:variegata_project/pages/profile/favorit.dart';
import 'package:variegata_project/pages/profile/riwayat_pembelian.dart';
import 'package:variegata_project/pages/profile/status_pemesanan.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 33,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 355,
                    height: 74,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD9D9D9),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 13,
                            bottom: 13,
                          ),
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 13, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "BhreKheley",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "+6283877176446",
                                style: TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "nabil321@gmail.com",
                                style: TextStyle(
                                  color: Color(0xFFADADAD),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 109,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Center(
                            child: Text(
                              "Ubah",
                              style: TextStyle(
                                color: Color(0xFF94AF9F),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Pesanan & Aktivitas
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Pesanan & Aktivitas",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Favorit()));
                  },
                  child: IconMenu(
                    'favorit.svg',
                    'Favorit',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StatusPemesanan()));
                  },
                  child: IconMenu(
                    'status-pemesanan.svg',
                    'Status Pemesanan',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RiwayatPembelian()));
                  },
                  child: IconMenu(
                    'riwayat-pembelian.svg',
                    'Riwayat Pembelian',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
                //Pengaturan Akun
                SizedBox(
                  height: 30,
                ),
                //Pengaturan Akun
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Pengaturan Akun",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                IconMenu(
                  'edit-profil.svg',
                  'Edit Profil',
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                IconMenu(
                  'alamat-pengiriman.svg',
                  'Alamat Pengiriman',
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
                SizedBox(
                  height: 30,
                ),
                //Informasi Lainnya
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Informasi Lainnya",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                IconMenu(
                  'pusat-bantuan.svg',
                  'Pusat Bantuan',
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    thickness: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                IconMenu(
                  'tentang-kami.svg',
                  'Tentang Kami',
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      width: 355,
                      height: 50,
                      child: Center(
                        child: Text(
                          "LOGOUT",
                          style: TextStyle(
                            color: Color(0xFFA4BFAF),
                            fontSize: 27,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFA4BFAF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget IconMenu(String image, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            // width: 343,
            // height: 37,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/profile/$image',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      title.toString(),
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
        ],
      ),
    );
  }
}
