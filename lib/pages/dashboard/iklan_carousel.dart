import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Iklan_carousel extends StatefulWidget {
  Iklan_carousel({Key? key}) : super(key: key);

  @override
  State<Iklan_carousel> createState() => _Iklan_carouselState();
}

class _Iklan_carouselState extends State<Iklan_carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 99,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  decoration: BoxDecoration(
                      color: Color(0xFFDBE4C6),
                      borderRadius: BorderRadius.circular(10)),
                  child: Image(
                    image: AssetImage('assets/img/bg-carousel.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 167,
                        child: Text(
                          'Toko Variegata',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF94AF9F)),
                        ),
                      ),
                      Container(
                        width: 157,
                        child: Text(
                          'Cari Kebutuhan Berkebun mu dengan cara yang mudah',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF94AF9F)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 3.5,
                  child: Container(
                    // color: Colors.amber,
                    height: 75,
                    width: 107,
                    child: Image(
                        image: AssetImage('assets/img/samplecarousel.png')),
                  ),
                )
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
