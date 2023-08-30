// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:variegata_project/pages/catalog_shop/cart.dart';
import 'package:variegata_project/pages/catalog_shop/checkout.dart';

import '../../common/widget/mapFunction.dart';

class TambahAlamat extends StatefulWidget {
  TambahAlamat({super.key, required this.currentAddress});
  final String currentAddress;

  @override
  State<TambahAlamat> createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  late LatLng MyPosition;
  bool isloading = true;
  String _currentAddress = "";

  @override
  void initState() {
    super.initState();
    getLocationAndAddress(_onLocationReceived);
  }

  void _onLocationReceived(LatLng myPosition, String currentAddress) {
    setState(() {
      MyPosition = myPosition;
      _currentAddress = currentAddress;
      isloading = false;
    });
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
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ),
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
                          "Pilih titik lokasi yang sesuai atau mendekati",
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
                child: const TextField(
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
                child: const TextField(
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
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Masukan nomor telpon penerima paket',
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
                'Catatan untuk Driver (Opsional)',
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
                child: const TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Isi patokan/petunjuk arah',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 85,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Checkout()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9ED098),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Center(
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
