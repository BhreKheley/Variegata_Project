import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:variegata_project/Services/auth_services.dart';
import 'package:variegata_project/auth/login_page.dart';
import 'package:variegata_project/pages/ProfilContent/Riwayat.dart';
import 'package:variegata_project/pages/catalog_shop/Alamat%20Utama/Alamat%20Utama%20Profile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = '';
  String _email = '';

  Future<void> _showLogoutConfirmationDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () async {
                Navigator.of(context).pop();
                await logout();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> logout() async {
    final accessToken = await AuthServices.getTokenFromLocalStorage();

    if (accessToken != null) {
      final url = Uri.parse('https://variegata.my.id/api/logout');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // Logout berhasil
        await AuthServices.removeTokenFromLocalStorage();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
              (Route<dynamic> route) => false,
        );
      } else {
        // Logout gagal, handle sesuai kebutuhan
        print('Logout gagal');
        // Anda dapat mencetak pesan kesalahan dari respons jika perlu
        print(response.body);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Panggil metode untuk mengambil data user saat halaman profil dimuat
  }

  // Metode untuk mengambil data user dari penyimpanan lokal
  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 86,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFD9D9D9),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/img/profile-picture.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        _email,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Text(
                                "Ubah",
                                style: TextStyle(
                                  color: Color(0xFF94AF9F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Pesanan & Aktivitas
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Pesanan & Aktivitas",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RiwayatPembelian(),
                            ),
                          );
                        },
                        child: IconMenu(
                          'riwayat-pembelian.svg',
                          'Riwayat Pembelian',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Pengaturan Akun",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconMenu(
                        'edit-profil.svg',
                        'Edit Profil',
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFD9D9D9),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddressAll(),
                            ),
                          );
                        },
                        child: IconMenu(
                          'alamat-pengiriman.svg',
                          'Alamat Pengiriman',
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Color(0xFFD9D9D9),
                ),
                //Informasi Lainnya
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Informasi Lainnya",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconMenu(
                        'pusat-bantuan.svg',
                        'Pusat Bantuan',
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFD9D9D9),
                      ),
                      IconMenu(
                        'tentang-kami.svg',
                        'Tentang Kami',
                      ),
                      GestureDetector(
                        onTap: () async {
                          await _showLogoutConfirmationDialog();
                          await logout();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => LoginPage()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          child: Center(
                            child: Text(
                              'LOGOUT',
                              style: TextStyle(
                                color: Color(0xFFA4BFAF),
                                fontSize: 22,
                                fontFamily: 'Inter',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget IconMenu(String image, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/img/profile/$image',
                      width: 29,
                      height: 29,
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    Text(
                      title.toString(),
                      style: TextStyle(
                        color: Color(0xFF4F4F4F),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF505050),
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
