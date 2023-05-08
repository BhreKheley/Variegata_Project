import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/auth/register_page.dart';
import 'package:variegata_project/main.dart';
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
      backgroundColor: Color(0xFF94AF9F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 34,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  child: Image(
                    image: AssetImage("assets/img/profile-picture.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bhre Nabil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 21),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Cardds(
                      'history.svg',
                      'Daftar Pesanan',
                      'Lihat seluruh riwayat & status pesanan',
                    ),
                    Cardds(
                      'favorite.svg',
                      'Favorit',
                      'Lihat seluruh list favorit',
                    ),
                    Cardds(
                      'help.svg',
                      'Bantuan',
                      'Temukan informasi yang dibutuhkan',
                    ),
                    Cardds(
                      'location.svg',
                      'Kelola Alamat Pengiriman',
                      'Lengkapi / ganti informasi pribadi',
                    ),
                    Cardds(
                      'privacy_policy.svg',
                      'Kebijakan Privasi',
                      'Lengkapi / ganti informasi pribadi',
                    ),
                    Cardds(
                      'inbox.svg',
                      'Inbox',
                      'Lengkapi / ganti informasi pribadi',
                    ),
                    Container(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF01CB37)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Keluar",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF01CB37)),
                              ),
                              SvgPicture.asset('assets/img/keluar.svg')
                            ],
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 37),
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Cardds(String image, String title, String subTitle) {
    return Container(
      padding: EdgeInsets.only(left: 18),
      margin: EdgeInsets.only(bottom: 5),
      height: 80,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 21),
            padding: EdgeInsets.all(13),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Color(0xFF94AF9F),
              shape: BoxShape.circle,
            ),
            child: Container(
              child: SvgPicture.asset(
                'assets/img/$image',
                width: 25,
                height: 25,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 170,
                child: Text(
                  subTitle.toString(),
                  style: TextStyle(
                      fontSize: 12, color: Colors.black.withOpacity(0.7)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
