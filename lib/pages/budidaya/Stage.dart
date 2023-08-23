import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Stage extends StatelessWidget {
  final int? bannerId;

  Stage({Key? key, required this.bannerId}) : super(key: key);

  Future<List<dynamic>> fetchBanners() async {
    final apiUrl = 'https://variegata.my.id/api/stages/banners/$bannerId';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banner Page'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchBanners(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error loading data from API'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final banner = snapshot.data?[index];
                return Container(
                  padding: EdgeInsets.only(bottom: 19),
                  child: Text(
                    banner['name'], // Ganti dengan atribut yang sesuai dari API
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
