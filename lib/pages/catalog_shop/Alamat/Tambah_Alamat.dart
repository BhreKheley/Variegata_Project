import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:variegata_project/pages/catalog_shop/Checkout/checkout_product.dart';

class AlamatModel {
  final String alamat;
  final String namaPenerima;
  final String nomorTelepon;
  final String catatan;

  AlamatModel({
    required this.alamat,
    required this.namaPenerima,
    required this.nomorTelepon,
    required this.catatan,
  });
}

class TambahAlamat extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;
  TambahAlamat(
      {Key? key,
        required this.currentAddress,
        required this.selectedProducts});
  final String currentAddress;

  @override
  State<TambahAlamat> createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController namaPenerimaController = TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  Future<String?> _getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  void _simpanData() async {
    final String alamat = alamatController.text;
    final String namaPenerima = namaPenerimaController.text;
    final String nomorTelepon = nomorTeleponController.text;
    final String catatan = catatanController.text;

    // Mengambil auth_token dari SharedPreferences
    final String? authToken = await _getAuthToken();

    if (alamat.isEmpty || namaPenerima.isEmpty || nomorTelepon.isEmpty || authToken == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text('Mohon lengkapi semua data yang diperlukan atau token tidak tersedia.'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    if (!nomorTelepon.contains(RegExp(r'^[0-9]+$')) || nomorTelepon.length != 12) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Peringatan'),
            content: Text('Nomor telepon harus berupa 12 digit angka.'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    final Map<String, dynamic> requestData = {
      'nama': namaPenerima,
      'alamat': alamat,
      'nomor_telepon': nomorTelepon,
      'catatan_driver': catatan,
    };

    final response = await http.post(
      Uri.parse('https://variegata.my.id/api/addresses'), // Ganti dengan URL endpoint Anda
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken', // Menambahkan Bearer token ke header
      },
      body: jsonEncode(requestData),
    );

    if (response.statusCode == 200) {
      final AlamatModel alamatModel = AlamatModel(
        alamat: alamat,
        namaPenerima: namaPenerima,
        nomorTelepon: nomorTelepon,
        catatan: catatan,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sukses'),
            content: Text('Alamat Anda sudah terbuat.'),
            actions: <Widget>[
              TextButton(
                child: Text('Lanjut'),
                onPressed: () {
                  Navigator.of(context).pop(); // Tutup dialog sukses
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CheckoutProduct(
                        alamatModel: alamatModel,
                        selectedProducts: widget.selectedProducts,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Terjadi kesalahan saat menyimpan data.'),
            actions: <Widget>[
              TextButton(
                child: Text('Tutup'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FA),
      appBar: AppBar(
        title: const Text(
          'Tambah Alamat',
          style: TextStyle(
            color: Color(0xFF4F4F4F),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Titik Lokasi',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 355,
                height: 98,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
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
                                    widget.currentAddress,
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Titik lokasi anda saat ini",
                          style: TextStyle(
                              color: Color(0xFF505050),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Image(
                      image: AssetImage("assets/img/lokasi.png"),
                      width: 58,
                      height: 58,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Alamat Lengkap',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: alamatController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Masukan alamat lengkap',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFD9D9D9),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Nama Penerima',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: namaPenerimaController,
                  decoration: InputDecoration(
                    hintText: 'Masukan nama penerima paket',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFD9D9D9),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'No. Telepon Penerima',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: nomorTeleponController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Masukan nomor telepon penerima paket',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFD9D9D9),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Catatan (Opsional)',
                style: TextStyle(
                  color: Color(0xFF4F4F4F),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: catatanController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Tambahkan catatan jika diperlukan',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFD9D9D9),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF9ED098),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton(
                  onPressed: _simpanData,
                  child: const Text(
                    'Simpan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
