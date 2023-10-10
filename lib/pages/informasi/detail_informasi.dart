import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailInformasi extends StatefulWidget {
  final dynamic product;
  DetailInformasi({required this.product});

  @override
  State<DetailInformasi> createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(
                context
            );
          },
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        title: Text(
          'Continue Reading',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product['name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 23,
                            height: 23,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Image.asset(
                              "assets/img/logo-mini.png",
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Variegata ',
                            style: TextStyle(
                              color: Color(0xFFBABABA),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFFBABABA),
                            ),
                          ),
                          Text(
                            DateFormat('dd, MMMM yyyy').format(DateTime.parse(widget.product['created_at'])),
                            style: TextStyle(
                              color: Color(0xFFBABABA),
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 350,
                        width: 350,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Sesuaikan dengan border radius yang Anda inginkan
                          child: Image.network(
                            'https://variegata.my.id/storage/${widget.product['image']}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(height: 10),
                    Text(widget.product['description'],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
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
