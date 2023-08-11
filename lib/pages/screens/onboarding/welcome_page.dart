import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                  image: AssetImage('assets/img/onboarding/welcome.png'),
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
                        'Selamat Datang di\nVariegata',
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
                        'Variegata adalah aplikasi petani bahasa Indonesia yang dapat membantu anda dalam menanam tanaman yang anda inginkan!.',
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
      //       // ignore: sized_box_for_whitespace
      //       Container(
      //           padding: EdgeInsets.zero,
      //           width: 400,
      //           height: 440,
      //           child: Stack(
      //             clipBehavior: Clip.none,
      //             children: [
      //               Container(),
      //               Positioned(
      //                 child: Image.asset(
      //                   'assets/img/onboarding/seeding.png',
      //                   height: 422,
      //                 ),
      //               ),
      //             ],
      //           )),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 20),
      //         child: Text(
      //           "Selamat Datang di Variegata",
      //             style: GoogleFonts.notoSerif(fontSize: 26, fontWeight: FontWeight.w600,
      //             ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(right: 100, top: 16),
      //         child: Text(
      //           "Variegata adalah aplikasi\npetani bahasa indonesia yang dapat\nmembantu anda dalam menanam\ntanaman yang anda inginkan!",
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
