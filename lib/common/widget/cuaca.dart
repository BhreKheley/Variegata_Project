import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
// ignore: unused_import
import 'package:shimmer/shimmer.dart';
import 'package:variegata_project/API/model_cuaca.dart';
import 'package:variegata_project/common/widget/shimmer.dart';

class Cuaca extends StatefulWidget {
  Cuaca({Key? key}) : super(key: key);

  @override
  State<Cuaca> createState() => _CuacaState();
}

class _CuacaState extends State<Cuaca> {
  CuacaModel? cuacaModel;
  bool loadingGetCuacaNabil = true;
  String? _currentTime;
  // ignore: unused_field
  String? _currentDate;
  int DateHour = DateTime.now().hour;
  late int indexModif;
  late String indexCuaca;
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAddress = "";

  @override
  void initState() {
    super.initState();
    getCuacaNabilGanteng();
    _getCurrentTime();
    _getCurrentDate();
    _getIndex();
    _bgCuaca();
    _getLocationAndAddress();
  }

  Future<void> _getLocationAndAddress() async {
    _currentLocation = await _getCurrentLocation();
    await _getAddressFromCoordinates();
  }

  Future<Position> _getCurrentLocation() async {
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if (!servicePermission) {
      print("service disable");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  _getAddressFromCoordinates() async {
    try {
      List<Placemark> placesmarks = await placemarkFromCoordinates(
          _currentLocation!.latitude, _currentLocation!.longitude);

      Placemark place = placesmarks[0];

      setState(() {
        _currentAddress = "${place.locality}";
      });
    } catch (e) {
      print(e);
    }
  }

  void getCuacaNabilGanteng() async {
    setState(() {
      loadingGetCuacaNabil = false;
    });

    final response = await http.get(
        Uri.parse(
            "https://cuaca-gempa-rest-api.vercel.app/weather/jawa-tengah/kudus"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    print("Status Code : ${response.statusCode}");
    print(response.body);
    cuacaModel = CuacaModel.fromJson(json.decode(response.body.toString()));

    setState(() {
      loadingGetCuacaNabil = true;
    });
  }

  void _getCurrentTime() {
    final formatter = DateFormat('HH:mm:ss').format(DateTime.now());
    setState(() {
      _currentTime = formatter;
    });
    // Refresh time every second
    Future.delayed(const Duration(seconds: 1), _getCurrentTime);
  }

  void _getCurrentDate() {
    final formatter = DateFormat('dd-MM-yyyy').format(DateTime.now());
    setState(() {
      _currentDate = formatter;
    });
    // Refresh time every second
    Future.delayed(const Duration(seconds: 1), _getCurrentDate);
  }

  void _getIndex() {
    if (DateHour >= 0 && DateHour < 6) {
      setState(() {
        indexModif = 0;
      });
    } else if (DateHour >= 6 && DateHour < 12) {
      setState(() {
        indexModif = 1;
      });
    } else if (DateHour >= 12 && DateHour < 18) {
      setState(() {
        indexModif = 2;
      });
    } else if (DateHour >= 18 && DateHour < 24) {
      setState(() {
        indexModif = 3;
      });
    } else {
      setState(() {
        indexModif = 0;
      });
      print('error');
    }
  }

  void _bgCuaca() {
    if (DateHour >= 0 && DateHour < 3) {
      setState(() {
        indexCuaca = 'malam';
      });
    } else if (DateHour >= 3 && DateHour < 6) {
      setState(() {
        indexCuaca = 'fajar';
      });
    } else if (DateHour >= 6 && DateHour < 12) {
      setState(() {
        indexCuaca = 'pagi';
      });
    } else if (DateHour >= 12 && DateHour < 15) {
      setState(() {
        indexCuaca = 'siang';
      });
    } else if (DateHour >= 15 && DateHour < 18) {
      setState(() {
        indexCuaca = 'sore';
      });
    } else if (DateHour >= 18 && DateHour < 24) {
      setState(() {
        indexCuaca = 'malam';
      });
    } else {
      setState(() {
        indexCuaca = 'siang';
      });
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadingGetCuacaNabil
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                  image: AssetImage('assets/img/cuaca/$indexCuaca.png'),
                  colorFilter: ColorFilter.mode(
                      const Color(0xFF939393).withOpacity(0.4), BlendMode.color),
                  fit: BoxFit.cover),
            ),
            height: 191,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Cuaca saat ini',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _currentTime ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${_currentAddress}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _currentDate ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Image(
                        image: AssetImage('assets/img/dashboard/cuaca.png'),
                        height: 70,
                        width: 81,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loadingGetCuacaNabil
                                ? cuacaModel!.data!.params![5]
                                        .times![indexModif].celcius!
                                        .replaceAll('C', '')
                                        .trim() +
                                    "°C".toString()
                                : '-',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 53,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            loadingGetCuacaNabil
                                ? cuacaModel!
                                    .data!.params![6].times![indexModif].name
                                    .toString()
                                : '-',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Cuaca saat ini cocok untuk kamu melakukan Penyiangan pada tanaman mu!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          )
        : ShimmerWidget(
            width: double.infinity,
            height: 191,
            // radius: 0,
          );
  }
}
