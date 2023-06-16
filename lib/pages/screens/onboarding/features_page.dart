import 'package:flutter/material.dart';

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
                    left: 125,
                    top: -25,
                    child: Container(
                      width: 400,
                      height: 330,
                      decoration: BoxDecoration(
                        color: Color(0xFFAEC2B6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    left: 120,
                    child: Container(
                      width: 36,
                      height: 36,
                      color: Color(0xFF94AF9F),
                    ),
                  ),
                  Positioned(
                    bottom: 130,
                    left: 100,
                    child: Container(
                      width: 36,
                      height: 36,
                      color: Color(0xFF94AF9F),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 160,
                    child: Image(
                      image: AssetImage('assets/img/onboarding/BudidayaMockup.png'),
                      width: 328,
                      height: 621,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 145, top: 42),
              child: Text(
                "Budidaya Tanaman\ndengan Bijak!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 85, top: 16),
              child: Text(
                "Mengoptimalkan pengalaman anda\nserta mempermudah anda dalam\nberkebun dan merawat tanaman.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
