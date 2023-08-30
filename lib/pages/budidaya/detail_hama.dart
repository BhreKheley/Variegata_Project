import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class DetailHamaPenyakit extends StatefulWidget {
  final dynamic product;
  DetailHamaPenyakit({required this.product});

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
            Navigator.pop(
              context,
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
                          widget.product['name'],
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
                              widget.product['tipe'],
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
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 220,
                        width: 320,
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://variegata.my.id/storage/${widget.product['image']}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
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
                                  '\u2022 Juga di temukan di: tomat, kubis, mentimun, stroberi, apel.\n')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tindakan Pencegahan",
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
                    Text(
                      "\u2022 Pemilihan varietas tanaman yang tahan terhadap kutu daun: Pilih varietas tanaman yang memiliki ketahanan atau resistansi terhadap serangan kutu daun. Beberapa varietas tanaman telah dikembangkan secara khusus untuk mengurangi risiko serangan kutu daun.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Praktik sanitasi: Pastikan kebersihan di sekitar area tanaman. Hapus dan hancurkan daun yang terinfeksi atau terkena serangan kutu daun untuk mencegah penyebaran lebih lanjut.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Rotasi tanaman: Lakukan rotasi tanaman secara teratur untuk mengurangi risiko penyebaran kutu daun. Hindari menanam tanaman yang rentan terhadap kutu daun secara berurutan pada area yang sama.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Penggunaan mulsa: Gunakan mulsa organik di sekitar tanaman untuk mencegah kutu daun naik ke bagian atas tanaman. Mulsa dapat menghalangi kutu daun yang berada di tanah naik ke batang dan daun tanaman.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Penggunaan semprotan air: Seringkali kutu daun dapat dihilangkan dengan semprotan air bertekanan. Semprotkan air pada tanaman secara teratur untuk membersihkan dan menghilangkan kutu daun yang ada.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Penggunaan predator alami: Tingkatkan populasi predator alami yang dapat memakan kutu daun, seperti kepik atau larva pengebor telur. Ini bisa dilakukan dengan menanam tanaman yang menarik predator alami, seperti bunga-bungaan yang mengundang kepik.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "\u2022 Penggunaan insektisida organik: Jika serangan kutu daun parah, pertimbangkan penggunaan insektisida organik yang aman dan ramah lingkungan. Pastikan untuk mengikuti petunjuk penggunaan dan dosis yang benar saat menggunakan insektisida.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
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
