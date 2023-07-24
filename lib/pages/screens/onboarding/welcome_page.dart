import 'package:flutter/material.dart';

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
                      bottom: -27,
                      child: Image.asset(
                        'assets/img/onboarding/seeding.png',
                        height: 472,
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 145, top: 42),
              child: Text(
                "Selamat Datang di \nVariegata",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 75, top: 16),
              child: Text(
                "Variegata adalah aplikasi\npetani bahasa indonesia yang dapat\nmembantu anda dalam menanam\ntanaman yang anda inginkan!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
