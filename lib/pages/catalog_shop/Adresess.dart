import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:variegata_project/pages/catalog_shop/cart.dart';
import 'dart:convert';

import 'checkout.dart';

class AddressData {
  final String nama;
  final String alamat;
  final String nomorTelepon;
  final String email;
  final String catatanDriver;

  AddressData({
    required this.nama,
    required this.alamat,
    required this.nomorTelepon,
    required this.email,
    required this.catatanDriver,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      nama: json['nama'],
      alamat: json['alamat'],
      nomorTelepon: json['nomor_telepon'],
      email: json['email'],
      catatanDriver: json['catatan_driver'],
    );
  }
}


class Adresess extends StatefulWidget {
  const Adresess({super.key});

  @override
  State<Adresess> createState() => _AdresessState();
}

class _AdresessState extends State<Adresess> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController catatanDriverController = TextEditingController();

  Future<void> storeAddress() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final url = Uri.parse('https://variegata.my.id/api/addresses');
    final response = await http.post(
      url,
      body: {
        'nama': namaController.text,
        'alamat': alamatController.text,
        'nomor_telepon': nomorTeleponController.text,
        'email': emailController.text,
        'catatan_driver': catatanDriverController.text,
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final savedAddress = AddressData.fromJson(responseData['address']); // Menggunakan 'address' bukan 'data'

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Checkout(addressData: savedAddress),
        ),
      );

  } else {
      final responseData = json.decode(response.body);
      final errorMessage = responseData['message'];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FA),
      appBar: AppBar(
        title: const Text(
          "Tambah Alamat",
          style: TextStyle(color: Color(0xFF33363F)),
        ),
        backgroundColor: const Color(0xFFF6F7FA),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFF33363F),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Alamat Lengkap",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: alamatController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Masukkan alamat lengkap',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Nama Penerima",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama penerima paket',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "No. Telepon Penerima",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: nomorTeleponController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nomor telepon penerima',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan alamat email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Catatan untuk Driver (Opsional)",
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: catatanDriverController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Isi patokan atau petunjuk arah',
                  ),
                ),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    storeAddress();
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9ED098),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
