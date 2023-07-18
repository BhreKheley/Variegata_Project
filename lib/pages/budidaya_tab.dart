import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:readmore/readmore.dart';

class BudidayaTab extends StatelessWidget {
  const BudidayaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            //PEMBENIHAN
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pembenihan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Image(
                    image: AssetImage("assets/img/pembenihan.png"),
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    "1. Siapkan biji cabai yang berkualitas dan bebas dari penyakit.\n"
                    "\n"
                    "2. Persiapkan media tanam yang cocok, seperti pot atau bedengan dengan campuran tanah dan kompos yang subur.\n"
                    "\n"
                    "3. Benamkan biji cabai di dalam media tanam dengan kedalaman sekitar 1-2 cm.\n"
                    "\n"
                    "4. Berikan penyiraman yang cukup agar media tetap lembab. \n"
                    "\n",
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Baca lebih lanjut",
                    trimExpandedText: "Lihat lebih sedikit",
                    colorClickableText: Color(0xFFBBD6B8),
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Dash(
              direction: Axis.horizontal,
              length: MediaQuery.of(context).size.width,
              dashLength: 6,
              dashColor: Color(0xFFE3E3E3),
              dashThickness: 2,
              dashGap: 6,
            ),
            //PENYEMAIAN
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Penyemaian",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Image(
                    image: AssetImage("assets/img/penyemaian.png"),
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    "1. Tempatkan wadah penyemaian di tempat yang terkena sinar matahari cukup.\n"
                    "\n"
                    "2. Jaga kelembaban media dengan penyiraman yang teratur.\n"
                    "\n"
                    "3. Setelah bibit cabai muncul, pastikan mereka mendapatkan cahaya yang cukup dan suhu yang hangat.\n"
                    "\n"
                    "4. Setelah bibit cabai muncul, pastikan mereka mendapatkan cahaya yang cukup dan suhu yang hangat. \n\n"
                    "\n",
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Baca lebih lanjut",
                    trimExpandedText: "Lihat lebih sedikit",
                    colorClickableText: Color(0xFFBBD6B8),
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Dash(
              direction: Axis.horizontal,
              length: MediaQuery.of(context).size.width,
              dashLength: 6,
              dashColor: Color(0xFFE3E3E3),
              dashThickness: 2,
              dashGap: 6,
            ),
            //PENANAMAN
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Penanaman",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Image(
                    image: AssetImage("assets/img/penanaman.png"),
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    "1. Pilih lokasi penanaman yang mendapatkan sinar matahari penuh dan memiliki drainase yang baik.\n"
                    "\n"
                    "2. Siapkan lubang tanam dengan jarak yang sesuai antara tanaman cabai.\n"
                    "\n"
                    "3. Pindahkan bibit cabai dengan hati-hati ke lubang tanam.\n"
                    "\n"
                    "4. Ratakan tanah di sekitar tanaman dan beri penyiraman setelah penanaman. \n"
                    "\n",
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Baca lebih lanjut",
                    trimExpandedText: "Lihat lebih sedikit",
                    colorClickableText: Color(0xFFBBD6B8),
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Dash(
              direction: Axis.horizontal,
              length: MediaQuery.of(context).size.width,
              dashLength: 6,
              dashColor: Color(0xFFE3E3E3),
              dashThickness: 2,
              dashGap: 6,
            ),
            //PERAWATAN
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Perawatan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Image(
                    image: AssetImage("assets/img/perawatan.png"),
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    "1. Lakukan penyiraman secara teratur untuk menjaga kelembaban tanah, terutama saat tanaman masih muda.\n"
                    "\n"
                    "2. Berikan pupuk yang sesuai, seperti pupuk organik atau pupuk khusus untuk tanaman cabai.\n"
                    "\n"
                    "3. Periksa dan atasi hama atau penyakit yang mungkin menyerang tanaman, seperti ulat, kutu, atau penyakit layu.\n"
                    "\n"
                    "4. Jaga kebersihan area penanaman dengan membersihkan gulma dan membuang daun atau ranting yang sudah mati. \n"
                    "\n",
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Baca lebih lanjut",
                    trimExpandedText: "Lihat lebih sedikit",
                    colorClickableText: Color(0xFFBBD6B8),
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Dash(
              direction: Axis.horizontal,
              length: MediaQuery.of(context).size.width,
              dashLength: 6,
              dashColor: Color(0xFFE3E3E3),
              dashThickness: 2,
              dashGap: 6,
            ),
            //PANEN
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 25,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Panen",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 25),
                  Image(
                    image: AssetImage("assets/img/panen.png"),
                  ),
                  SizedBox(height: 25),
                  ReadMoreText(
                    "1. Biasanya, cabai siap panen dalam waktu 2-3 bulan setelah penanaman, tergantung pada varietasnya.\n"
                    "\n"
                    "2. Panen cabai saat sudah mencapai ukuran yang diinginkan dan warnanya telah matang.\n"
                    "\n"
                    "3. Gunakan pisau atau gunting tajam untuk memotong cabai dengan tangkainya.\n"
                    "\n"
                    "4. Jangan lupa untuk menjaga kebersihan tangan saat memanen dan menyimpan cabai dalam kondisi yang baik. \n"
                    "\n",
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Baca lebih lanjut",
                    trimExpandedText: "Lihat lebih sedikit",
                    colorClickableText: Color(0xFFBBD6B8),
                    style: TextStyle(
                      color: Color(0xFF585858),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Dash(
              direction: Axis.horizontal,
              length: MediaQuery.of(context).size.width,
              dashLength: 6,
              dashColor: Color(0xFFE3E3E3),
              dashThickness: 2,
              dashGap: 6,
            ),
          ],
        ),
      ),
    );
  }
}
