import 'package:flutter/material.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFFFFFFFFF),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Color(0xFFD9D9D9),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/img/profile-picture.png"),
                                width: 32,
                                height: 32,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "BhreKheley",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Bhre Nabil",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Ubah",
                            style: TextStyle(
                              color: Color(0xff94af9f),
                              fontSize: 11,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Akun",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Cardds(
                      'history.svg',
                      'Riwayat Transaksi',
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pusat Akun",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Cardds(
                      'help.svg',
                      'Pusat Bantuan',
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    Cardds(
                      'security.svg',
                      'Kebijakan Privasi',
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pusat Akun",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Cardds(
                      'help.svg',
                      'Pusat Bantuan',
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    Cardds(
                      'security.svg',
                      'Kebijakan Privasi',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Container(
                  width: 320,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Color(0xffa3bfae),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 34,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => LoginPage(),
              //           ),
              //         );
              //       },
              //       child: Container(
              //         width: 40,
              //         height: 40,
              //         decoration: BoxDecoration(
              //           color: Colors.white.withOpacity(0.3),
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         child: Icon(
              //           Icons.arrow_back,
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       "Profile",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w600,
              //         fontSize: 20,
              //       ),
              //     ),
              //     Container(
              //       width: 40,
              //       height: 40,
              //       decoration: BoxDecoration(
              //         color: Colors.white.withOpacity(0.3),
              //         borderRadius: BorderRadius.circular(5),
              //       ),
              //       child: Icon(
              //         Icons.edit,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 26,
              // ),
              // Container(
              //   width: 80,
              //   height: 80,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.25),
              //         spreadRadius: 2,
              //         blurRadius: 10,
              //         offset: Offset(0, 0), // changes position of shadow
              //       ),
              //     ],
              //   ),
              //   child: CircleAvatar(
              //     child: Image(
              //       image: AssetImage("assets/img/profile-picture.png"),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Bhre Nabil",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w700,
              //     fontSize: 15,
              //   ),
              // ),
              // Container(
              //   clipBehavior: Clip.hardEdge,
              //   margin: EdgeInsets.only(top: 21),
              //   width: MediaQuery.of(context).size.width,
              //   // height: MediaQuery.of(context).size.height,
              //   decoration: BoxDecoration(
              //     color: Color(0xFFD9D9D9),
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(30),
              //         topRight: Radius.circular(30)),
              //   ),
              //   child: Column(
              //     children: [
              //       Cardds(
              //         'history.svg',
              //         'Daftar Pesanan',
              //         'Lihat seluruh riwayat & status pesanan',
              //       ),
              //       Cardds(
              //         'favorite.svg',
              //         'Favorit',
              //         'Lihat seluruh list favorit',
              //       ),
              //       Cardds(
              //         'help.svg',
              //         'Bantuan',
              //         'Temukan informasi yang dibutuhkan',
              //       ),
              //       Cardds(
              //         'location.svg',
              //         'Kelola Alamat Pengiriman',
              //         'Lengkapi / ganti informasi pribadi',
              //       ),
              //       Cardds(
              //         'privacy_policy.svg',
              //         'Kebijakan Privasi',
              //         'Lengkapi / ganti informasi pribadi',
              //       ),
              //       Cardds(
              //         'inbox.svg',
              //         'Inbox',
              //         'Lengkapi / ganti informasi pribadi',
              //       ),
              //       Container(
              //         child: Center(
              //           child: Container(
              //             padding: EdgeInsets.symmetric(horizontal: 24),
              //             height: 45,
              //             decoration: BoxDecoration(
              //                 border: Border.all(color: Color(0xFF01CB37)),
              //                 borderRadius: BorderRadius.circular(10)),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   "Keluar",
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.w600,
              //                       color: Color(0xFF01CB37)),
              //                 ),
              //                 SvgPicture.asset('assets/img/keluar.svg')
              //               ],
              //             ),
              //           ),
              //         ),
              //         padding: EdgeInsets.symmetric(horizontal: 37),
              //         width: MediaQuery.of(context).size.width,
              //         height: 80,
              //         color: Colors.white,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Cardds(String image, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/img/$image',
                    width: 25,
                    height: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    title.toString(),
                    style: TextStyle(
                      color: Color(0xff4f4f4f),
                      fontSize: 16,
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
        ],
      ),
    );
  }
}
