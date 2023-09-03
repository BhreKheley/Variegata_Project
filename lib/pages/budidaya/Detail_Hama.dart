import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailHamaPenyakit extends StatefulWidget {

  final dynamic product;
  DetailHamaPenyakit({required this.product});

  @override
  State<DetailHamaPenyakit> createState() => _DetailHamaPenyakitState();
}

class _DetailHamaPenyakitState extends State<DetailHamaPenyakit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(
        //       context
        //     );
        //   },
        //   color: Colors.black,
        // ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              child: Image(
                                image: AssetImage('assets/img/hama_icon.png'),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                                widget.product['tipe'],
                              style: TextStyle(
                                color: Color(0xff7f7f7f),
                                fontSize: 17,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 220,
                      width: 320,
                      child: CachedNetworkImage(
                        imageUrl: 'https://variegata.my.id/storage/${widget.product['image']}',
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: 59,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffd9d9d9),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product['name'],
                      style: TextStyle(
                        color: Color(0xff7f7f7f),
                        fontSize: 17,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.product['description'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Inter",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Gejala:',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\u2022 Daun kering\n',
                          ),
                          TextSpan(
                            text: '\u2022 Perubahan warna daun\n',
                          ),
                          TextSpan(
                            text: '\u2022 Stunt atau kerdil\n',
                          ),
                          TextSpan(
                            text: '\u2022 Muncul nya lapisan lengket\n',
                          ),
                          TextSpan(
                            text: '\u2022 Keberadaan semut\n',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Info lebih lanjut',
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\u2022 Nama ilmiah: ',
                          ),
                          TextSpan(
                            text: 'Aphids\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                              text:
                              '\u2022 Juga di temukan di: tomat, kubis, mentimun, stroberi, apel.\n')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tindakan Pencegahan",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product['cegah'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
