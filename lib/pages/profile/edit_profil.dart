import 'package:flutter/material.dart';
import 'package:variegata_project/common/widget/bottom_navbar.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Edit Profil",
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
                builder: (context) => BotNavbar(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              child: Icon(
                Icons.person,
                color: Color(0xFF90AF9D),
                size: 50,
              ),
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFFECF4EB),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Pengguna',
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukan nama anda',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFFD9D9D9),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Email Pengguna',
                  style: TextStyle(
                    color: Color(0xFF4F4F4F),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: 'nabil132@gmail.com',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Color(0xFFD9D9D9),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 40,
            child: Center(
              child: Text(
                "Simpan",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF9ED098),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ),
    );
  }
}
