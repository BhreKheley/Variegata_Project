import 'package:flutter/material.dart';
import 'package:variegata_project/pages/budidaya_detail.dart';

class DetailHamaPenyakit extends StatefulWidget {
  DetailHamaPenyakit({Key? key}) : super(key: key);

  @override
  State<DetailHamaPenyakit> createState() => _DetailHamaPenyakitState();
}

class _DetailHamaPenyakitState extends State<DetailHamaPenyakit> {
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
                    DetailBudidaya(), // Ganti dengan halaman berikutnya
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kutu Daun',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              child: Image(
                                image: AssetImage('assets/img/hama_icon.png'),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Hama",
                              style: TextStyle(
                                color: Color(0xff7f7f7f),
                                fontSize: 17,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 320,
                      height: 181,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.amber,
                        image: DecorationImage(
                          image: AssetImage('assets/img/hama.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: 59,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
