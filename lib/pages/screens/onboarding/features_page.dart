import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0xFFDFE7E2),
              width: 400,
              height: 440,
              child: Stack(
                children: [
                  Positioned(
                    left: 100,
                    top: -20,
                    child: Container(
                      width: 400,
                      height: 410,
                      decoration: BoxDecoration(
                        color: Color(0xFFAEC2B6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 100,
                    child: Container(
                      width: 36,
                      height: 36,
                      color: Color(0xFF94AF9F),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 80,
                    child: Container(
                      width: 36,
                      height: 36,
                      color: Color(0xFF94AF9F),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 100,
                    child: Image(
                      image: AssetImage('assets/img/onboarding/BudidayaMockup.png'),
                      width: 328,
                      height: 500,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, top: 10),
              child: Text(
                "Budidaya tanaman dengan bijak!",
                style: GoogleFonts.notoSerif(fontSize: 26, fontWeight: FontWeight.w600,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100, top: 16),
              child: Text(
                "Mengoptimalkan pengalaman anda\nserta mempermudah anda dalam\nberkebun dan merawat tanaman.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
