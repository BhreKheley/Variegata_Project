import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: const BoxDecoration(),
                child: Image(
                  image: AssetImage('assets/img/onboarding/getStarted.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Text(
                        'Lengkapi Kebutuhan\nBerkebunmu',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Jelajahi Katalog dengan Ribuan Jenis kebutuhan yang tersedia dalam satu aplikasi yang memudahkan Anda memilih dan membeli produk-produk berkualitas tinggi.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // backgroundColor: Colors.white,
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Container(
      //         color: Color(0xFFDFE7E2),
      //         width: 400,
      //         height: 440,
      //         child: Stack(
      //           children: [
      //             Positioned(
      //               left: 45,
      //               top: 36,
      //               child: Image(
      //                 image: AssetImage('assets/img/onboarding/Vector1.png'),
      //               ),
      //             ),
      //             Positioned(
      //               left: 95,
      //               top: 200,
      //               child: Image(
      //                 image: AssetImage('assets/img/onboarding/Vector2.png'),
      //               ),
      //             ),
      //             Positioned(
      //               left: 310,
      //               top: 160,
      //               child: Image(
      //                 image: AssetImage('assets/img/onboarding/Vector3.png'),
      //               ),
      //             ),
      //             Positioned(
      //               top: 40,
      //               right: 30,
      //               child: Container(
      //                 width: 62,
      //                 height: 62,
      //                 decoration: BoxDecoration(
      //                     color: Color(0xFF99A9A0),
      //                     borderRadius: BorderRadius.circular(90)),
      //               ),
      //             ),
      //             Positioned(
      //               top: 140,
      //               right: 35,
      //               child: Container(
      //                 width: 36,
      //                 height: 36,
      //                 decoration: BoxDecoration(
      //                     color: Color(0xFFCEE4CB),
      //                     borderRadius: BorderRadius.circular(90)),
      //               ),
      //             ),
      //             Positioned(
      //               top: 105,
      //               right: 30,
      //               child: Container(
      //                 width: 45,
      //                 height: 45,
      //                 decoration: BoxDecoration(
      //                     color: Color(0xFFA2BEAD),
      //                     borderRadius: BorderRadius.circular(90)),
      //               ),
      //             ),
      //             Positioned(
      //               top: 40,
      //               right: 120,
      //               child: Image(
      //                 image:
      //                     AssetImage('assets/img/onboarding/BudidayaMockup.png'),
      //                 width: 308,
      //                 height: 601,
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 70, top: 10),
      //         child: Text(
      //           "Lengkapi Kebutuhan\nBerkebunmu",
      //           style: GoogleFonts.notoSerif(fontSize: 26, fontWeight: FontWeight.w600,),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 90, top: 16),
      //         child: Text(
      //           "Jelajahi Katalog dengan Ribuan Jenis\nkebutuhan yang tersedia dalam satu\naplikasi yang memudahkan Anda\nmemilih dan membeli produk-produk\nberkualitas tinggi.",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
