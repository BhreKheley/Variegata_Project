import 'package:flutter/material.dart';

class ContentDetail extends StatelessWidget {
  final dynamic content;
  ContentDetail({required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          content['name'],
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content['title'],
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Image.network(
                    'https://variegata.my.id/storage/${content['image']}',
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, exception, stackTrace) {
                      return Icon(Icons.error);
                    },
                    fit: BoxFit.cover,
                    width: 395,
                    height: 201,
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      width: 139,
                      height: 27,
                      decoration: BoxDecoration(
                        color: Color(0xFFE3CA8A),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(3),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          content['name'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                content['week'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                content['description'],
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
