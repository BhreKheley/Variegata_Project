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
                thickness: 3.5,
                color: Color(0xFFEBEBEB),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bantuan dan Dukungan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Cardds(
                      'help.svg',
                      'Pusat Bantuan',
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    Cardds(
                      'security.svg',
                      'Kebijakan Privasi',
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    Cardds(
                      'security.svg',
                      'Kebijakan Privasi',
                    ),
                    Divider(
                      thickness: 1,
                      color: Color(0xFFD9D9D9),
                    ),
                    Cardds(
                      'security.svg',
                      'Kebijakan Privasi',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Divider(
                thickness: 3.5,
                color: Color(0xFFEBEBEB),
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
              SizedBox(height: 25,)
            ],
          ),
        ),
      ),
    );
  }

  Widget Cardds(String image, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 13),
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
