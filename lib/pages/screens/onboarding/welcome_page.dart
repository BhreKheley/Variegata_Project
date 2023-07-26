import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.zero,
                width: 400,
                height: 440,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(),
                    Positioned(
                      child: Image.asset(
                        'assets/img/onboarding/seeding.png',
                        height: 422,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "Selamat Datang di Variegata",
                  style: GoogleFonts.notoSerif(fontSize: 26, fontWeight: FontWeight.w600,
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100, top: 16),
              child: Text(
                "Variegata adalah aplikasi\npetani bahasa indonesia yang dapat\nmembantu anda dalam menanam\ntanaman yang anda inginkan!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
