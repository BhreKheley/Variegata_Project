import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:variegata_project/common/widget/content_large.dart';
import 'package:variegata_project/common/widget/content_small.dart';

class BudidayaTab extends StatelessWidget {
  BudidayaTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 4, // Atur nilai elevation sesuai kebutuhan
              color: Color(0xFFDCDEE4),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tahap Prapembibitan',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 193,
                          child: Text(
                            '4 minggu sebelum pembibitan',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 21,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Image(
                      image:
                          AssetImage("assets/img/budidaya/prapembibitan.png"),
                      width: 80,
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 19),
                    child: Text(
                      '4 Minggu sebelum pembibitan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  LargeContent(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Dash(
                      // length: MediaQuery.of(context).size.width,
                      length: 320,
                      dashThickness: 2,
                      dashColor: Color(0xFFE3E3E3),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 19),
                    child: Text(
                      '3 Minggu sebelum pembibitan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContent(),
                      SmallContent(),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Dash(
                      // length: MediaQuery.of(context).size.width,
                      length: 320,
                      dashThickness: 2,
                      dashColor: Color(0xFFE3E3E3),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 19),
                    child: Text(
                      '2 Minggu sebelum pembibitan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContent(),
                      SmallContent(),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  SmallContent(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Dash(
                      // length: MediaQuery.of(context).size.width,
                      length: 320,
                      dashThickness: 2,
                      dashColor: Color(0xFFE3E3E3),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 19),
                    child: Text(
                      '1 Minggu sebelum pembibitan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallContent(),
                      SmallContent(),
                    ],
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Material(
                  elevation: 4, // Atur nilai elevation sesuai kebutuhan
                  color: Color(0xFFFFC672),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tahap Pembibitan',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minggu 1 - 3',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage(
                              "assets/img/budidaya/tahap-pembibitan.png"),
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 3',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      SmallContent(),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Material(
                  elevation: 4, // Atur nilai elevation sesuai kebutuhan
                  color: Color(0xFFFF9494),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tahap Vegetatif',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minggu 4 - 12',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage(
                              "assets/img/budidaya/tahap-vegetatif.png"),
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 4',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 5',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 6',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 7',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 8',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 9',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 10',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 11',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 12',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 4",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ContentShort(),
            //           ContentShort(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 5",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 6",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Minggu 7",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Tidak ada tugas pada minggu ini",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 8",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 9",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Minggu 10",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Tidak ada tugas pada minggu ini",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 11",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ContentShort(),
            //           ContentShort(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Minggu 12",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Tidak ada tugas pada minggu ini",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Column(
              children: [
                Material(
                  elevation: 4, // Atur nilai elevation sesuai kebutuhan
                  color: Color(0xFFA5DFFF),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tahap Berbunga',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minggu 13 - 15',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage(
                              "assets/img/budidaya/tahap-berbunga.png"),
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 13',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 14 - 15',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Material(
                  elevation: 4, // Atur nilai elevation sesuai kebutuhan
                  color: Color(0xFFFFF6A5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tahap Berbuah',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minggu 16 - 18',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage(
                              "assets/img/budidaya/tahap-berbuah.png"),
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 16',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 17',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 18',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 16",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 17",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ContentShort(),
            //           ContentShort(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 340,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Minggu 18",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Tidak ada tugas pada minggu ini",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Column(
              children: [
                Material(
                  elevation: 4, // Atur nilai elevation sesuai kebutuhan
                  color: Color(0xFFDDFFA5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tahap Panen',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minggu 19 - 22',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image(
                          image:
                              AssetImage("assets/img/budidaya/tahap-panen.png"),
                          width: 80,
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 19',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      LargeContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 20',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallContent(),
                          SmallContent(),
                        ],
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      SmallContent(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Dash(
                          // length: MediaQuery.of(context).size.width,
                          length: 320,
                          dashThickness: 2,
                          dashColor: Color(0xFFE3E3E3),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 19),
                        child: Text(
                          'Minggu 21 - 22',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        'Tidak ada tugas pada minggu ini',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 19",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // ContentLength(),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 332,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //     bottom: 20,
            //   ),
            //   child: Text(
            //     "Minggu 20",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           ContentShort(),
            //           ContentShort(),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 19,
            //       ),
            //       ContentShort(),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Dash(
            //     direction: Axis.horizontal,
            //     length: 340,
            //     dashLength: 6,
            //     dashThickness: 2,
            //     dashColor: Color(0xFFE3E3E3),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Minggu 21 - 22",
            //     style: TextStyle(
            //       fontSize: 21,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 20,
            //     right: 20,
            //   ),
            //   child: Text(
            //     "Tidak ada tugas pada minggu ini",
            //     style: TextStyle(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }

  Widget ContentShort() {
    return Container(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image(
                  image: AssetImage("assets/img/budidaya/activity-1.png"),
                  width: 140,
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  // Properti dan styling untuk Container yang menimpa gambar
                  width: 111,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Color(0xFFE3CA8A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3))),
                  child: Center(
                    child: Text(
                      'Pelatihan tanaman',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Persiapan lahan primer dengan cepat',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Klik lebih lanjut',
            style: TextStyle(
              color: Color(0xFFBBD6B8),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget ContentLength() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image(
                  image: AssetImage("assets/img/budidaya/pertumbuhan.png"),
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  // Properti dan styling untuk Container yang menimpa gambar
                  width: 115,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Color(0xFFE3CA8A),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(3))),
                  child: Center(
                    child: Text(
                      "Pelatihan tanaman",
                      style: TextStyle(
                        fontSize: 14,
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
            height: 13,
          ),
          Text(
            'Jarangkan bibit untuk menghasil kan tegakan tanaman yang sehat',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          Text(
            'Klik lebih lanjut',
            style: TextStyle(
              color: Color(0xFFBBD6B8),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
