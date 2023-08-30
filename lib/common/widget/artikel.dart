import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Artikel_carousel extends StatefulWidget {
  Artikel_carousel({Key? key}) : super(key: key);

  @override
  State<Artikel_carousel> createState() => _Artikel_carouselState();
}

class _Artikel_carouselState extends State<Artikel_carousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Since there's only one item in the list
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 194,
            height: 140,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 194,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      const BoxShadow(
                        color: Color(0x3f000000),
                        blurRadius: 14,
                        offset: Offset(0, 5),
                      ),
                    ],
                    color: const Color(0xffd9d9d9),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 194,
                            height: 101,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 194,
                                      height: 101,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: const Image(
                                        image: AssetImage(
                                          'assets/img/bg-artikel.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      width: 99,
                                      height: 104,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xcc94af9f),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            width: 194,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 8,
                        top: 37,
                        child: SizedBox(
                          width: 83,
                          child: Text(
                            "Nama Latin Tanaman Tomat beserta Ciri-Cirinya",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 8,
                        top: 109,
                        child: Text(
                          "Kenali Nama Latin Tanaman Tomat beserta\nJenis - Jenisnya!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 19,
                        top: 82,
                        child: Text(
                          "Variegata",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: 81,
                        child: Container(
                          width: 9,
                          height: 8.96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset('assets/img/logo.svg'),
                        ),
                      ),
                      Positioned(
                        left: 6,
                        top: 10,
                        child: Container(
                          width: 16,
                          height: 16,
                          child: const Image(
                            image: AssetImage(
                              'assets/img/info-logo.png',
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 23,
                        top: 15,
                        child: Text(
                          "InVarita",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
