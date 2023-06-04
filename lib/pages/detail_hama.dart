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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kutu Daun",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Kutu daun (Aphids)',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text:
                                ' adalah serangga kecil yang umumnya hidup di bagian atas atau bawah daun tanaman. Mereka menghisap sari-sari tanaman dan dapat menyebabkan kerusakan pada pertumbuhan dan kualitas tanaman. ',
                          ),
                          TextSpan(
                            text:
                                'Kutu daun biasanya berwarna hijau, kuning, atau hitam, dan dapat berkembang biak dengan cepat. ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Mereka sering menjadi hama yang mengganggu pada tanaman, terutama pada tanaman sayuran seperti cabai. Kutu daun dapat ditangani dengan menggunakan metode pengendalian yang tepat, seperti penggunaan insektisida alami atau pestisida nabati, serta menjaga kebersihan dan kestabilan lingkungan tumbuhan.',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Gejala:',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\u2022 Daun kering\n',
                          ),
                          TextSpan(
                            text: '\u2022 Perubahan warna daun\n',
                          ),
                          TextSpan(
                            text: '\u2022 Stunt atau kerdil\n',
                          ),
                          TextSpan(
                            text: '\u2022 Muncul nya lapisan lengket\n',
                          ),
                          TextSpan(
                            text: '\u2022 Keberadaan semut\n',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Info lebih lanjut',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\u2022 Nama ilmiah: ',
                          ),
                          TextSpan(
                            text: 'Aphids\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text:
                                '\u2022 Juga di temukan di: tomat, kubis, mentimun, stroberi, apel.\n',
                          ),
                        ],
                      ),
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
}
