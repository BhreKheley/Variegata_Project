import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:variegata_project/pages/catalog_shop/Alamat/Mini_map.dart';
import 'package:variegata_project/pages/catalog_shop/Checkout/checkout.dart';

class AlamatAll extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;
  const AlamatAll({Key? key, required this.selectedProducts}) : super(key: key);

  @override
  State<AlamatAll> createState() => _AlamatAllState();
}

class _AlamatAllState extends State<AlamatAll> {
  Future<List<dynamic>>? addresses;
  int? selectedAddressIndex;

  @override
  void initState() {
    super.initState();
    addresses = fetchAddresses();
  }

  Future<String?> _getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<List<dynamic>> fetchAddresses() async {
    final String? authToken = await _getAuthToken();

    final response = await http.get(
      Uri.parse('https://variegata.my.id/api/addresses'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['addresses'];
    } else {
      throw Exception('Gagal mengambil data alamat');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      appBar: AppBar(
        title: Text(
          "Daftar Alamat Saya",
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
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MiniMap(
                    selectedProducts: widget.selectedProducts,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Center(
                            child: Container(
                              child: Row(
                                children: [
                                  Image(
                                    image: AssetImage("assets/img/pin.png"),
                                    width: 14,
                                    height: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      "Klik untuk tambah alamat",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pilih titik lokasi anda yang sesuai",
                          style: TextStyle(
                            color: Color(0xFF505050),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage("assets/img/lokasi.png"),
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: addresses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final address = snapshot.data![index];
                            return Card(
                              elevation: 2,
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    address['nama'],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 3,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      address['nomor_telepon'],
                                                      style: TextStyle(
                                                        color: Color(0xFF505050),
                                                        fontSize: 17,
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 240,
                                            child: Text(
                                              address['alamat'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xFF505050),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Radio(
                                        activeColor: Color(0xFF91C6A6),
                                        value: index, // Menggunakan indeks sebagai nilai
                                        groupValue: selectedAddressIndex,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedAddressIndex = value; // Mengatur indeks alamat yang dipilih
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: 90,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (selectedAddressIndex != null) {
                                      final selectedAddress = snapshot.data![selectedAddressIndex!]; // Menggunakan indeks untuk memilih alamat
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Checkout(
                                            selectedProducts: widget.selectedProducts,
                                            selectedAddress: selectedAddress,
                                          ),
                                        ),
                                      );
                                    } else {
                                      // Tampilkan pesan kesalahan jika pengguna belum memilih alamat.
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Peringatan'),
                                            content: Text('Pilih alamat terlebih dahulu.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF9ED098), // Warna latar belakang
                                    elevation: 0, // Hilangkan bayangan
                                    minimumSize: Size(double.infinity, 50), // Panjang dan tinggi tombol
                                    padding: EdgeInsets.zero, // Hilangkan padding dalam tombol
                                  ),
                                  child: Text(
                                    'Simpan',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
