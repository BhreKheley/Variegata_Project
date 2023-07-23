import 'package:flutter/material.dart';
import 'package:variegata_project/pages/budidaya/budidaya_detail.dart';

class ContentDetail extends StatefulWidget {
  const ContentDetail({super.key});

  @override
  State<ContentDetail> createState() => _ContentDetailState();
}

class _ContentDetailState extends State<ContentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Tahap Prapembibitan",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailBudidaya(),
              ),
            );
          },
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, top: 20, right: 25, bottom: 20),
              child: Text(
                "Jarangkan bibit untuk hasilkan tegakan tanaman yang sehat",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: 395,
                  height: 201,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/img/budidaya/pertumbuhan.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    // Properti dan styling untuk Container yang menimpa gambar
                    width: 139,
                    height: 27,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE3CA8A),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(3),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Pelatihan tanaman",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Text(
                "4 Minggu sebelum pembibitan",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Text(
                "Untuk menumbuhkan tanaman lada yang sehat dan produktif, utamakan lokasi yang dipilih bebas dari embun beku dan mendapat paparan pada arah selatan untuk memastikan bahwa tanah menghangat pada awal musim semi dan siap untuk ditanam. Baris harus berorientasi dari utara ke selatan sehingga tanaman mendapatkan sinat matahari sebanyak mungkin. Tanaman tumbuh paling baik ketika suhu siang hari berkisar 22-25 °C dan suhu malam hari tidak berada di bawah 12 °C. Hindari lahan dengan riwayat penyakit dan monokultur. Hindari tanah yang telah di gunakan untuk menanam lada, tomat, terong, atau kentang selama dua musim sebelumnya untuk mencegah penyakit.",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
