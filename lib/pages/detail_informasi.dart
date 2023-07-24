import 'package:flutter/material.dart';
import 'package:variegata_project/common/widget/info_card.dart';
import 'package:variegata_project/pages/informasi.dart';

class DetailInformasi extends StatefulWidget {
  DetailInformasi({Key? key}) : super(key: key);

  @override
  State<DetailInformasi> createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    InformasiPage(), // Ganti dengan halaman berikutnya
              ),
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        title: Text(
          'Continue Reading',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat: Mengungkap Keberagaman yang Menarik!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 23,
                            height: 23,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(
                              "assets/img/logo-mini.png",
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Variegata ',
                            style: TextStyle(
                              color: Color(0xFFBABABA),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFBABABA),
                            ),
                          ),
                          Text(
                            'Apr 04, 2092',
                            style: TextStyle(
                              color: Color(0xFFBABABA),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 313,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/img/tomat.png'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Tomat (Solanum lycopersicum) adalah tanaman tahunan yang berasal dari Amerika Tengah dan Selatan. Tanaman tomat termasuk dalam keluarga Solanaceae, yang juga mencakup tanaman seperti kentang dan terong. Tomat memiliki beragam variasi yang menghasilkan buah-buahan dengan bentuk, ukuran, dan warna yang berbeda. Nama Latin untuk tomat adalah Solanum lycopersicum.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Salah satu variasi populer adalah tomat cherry (Solanum lycopersicum var. cerasiforme). Tomat cherry menghasilkan buah-buahan berukuran kecil, biasanya seukuran gigitan, dengan rasa manis yang konsisten. Mereka sering digunakan sebagai pelengkap dalam hidangan, seperti salad, pasta, atau camilan segar.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Varian lain yang terkenal adalah tomat Roma (Solanum lycopersicum var. Roma). Tomat Roma memiliki bentuk lonjong yang khas dan daging yang padat. Mereka sering digunakan dalam masakan Italia, seperti saus tomat, sup, dan hidangan panggang. Tomat Roma sangat cocok untuk diolah karena memiliki kandungan air yang lebih rendah, menghasilkan saus yang lebih kental dan pekat.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tomat Beefsteak (Solanum lycopersicum var. Beefsteak) adalah varietas tomat yang menghasilkan buah berukuran besar dengan daging yang tebal dan sedikit biji. Mereka sering digunakan dalam sandwich, burger, dan hidangan utama lainnya karena tekstur dan rasa yang khas. Tomat Beefsteak sangat cocok untuk dipotong dalam irisan tebal dan digunakan dalam hidangan yang membutuhkan tomat dengan tekstur yang lebih padat.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Selain itu, ada juga varietas heirloom (Solanum lycopersicum var. Heirloom), yang merupakan tomat yang diwariskan dari generasi ke generasi dengan ciri khas rupa, warna, dan rasa yang unik. Varietas ini sering dikagumi karena keunikan dan keaslian mereka. Setiap varietas heirloom memiliki karakteristik yang berbeda, seperti warna-warni yang mencolok, rasa yang kompleks, dan tekstur yang unik.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 25, bottom: 15),
                      child: Text(
                        'Lihat lainnya',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CardInfo(
                      image: 'tomat.png',
                      title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                      kategori: 'Penyakit',
                    ),
                    CardInfo(
                      image: 'tomat.png',
                      title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                      kategori: 'Penyakit',
                    ),
                    CardInfo(
                      image: 'tomat.png',
                      title: 'Kenali Nama Latin dan Jenis-Jenis Tanaman Tomat:',
                      kategori: 'Penyakit',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
