// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';

// const MAPBOX_ACCESS_TOKEN =
//     'pk.eyJ1IjoibWlrYWEyOSIsImEiOiJjbGxkcXBsNTQwYncyM2dxdjFqN2VuZGFwIn0.j5VpcKbH6WjqW0JiHfD-YQ';
// // final myPosition = LatLng(-6.756154, 110.8435703);

// class TambahAlamat extends StatefulWidget {
//   const TambahAlamat({super.key});

//   @override
//   State<TambahAlamat> createState() => _TambahAlamatState();
// }

// class _TambahAlamatState extends State<TambahAlamat> {
//   Position? _currentLocation;
//   late bool servicePermission = false;
//   late LocationPermission permission;
//   // LatLng MyPosition = LatLng(-6.756154, 110.8435703);
//   late LatLng MyPosition;
//   bool isloading = true;

//   String _currentAddress = "";

//   @override
//   void initState() {
//     super.initState();
//     _getLocationAndAddress();
//   }

//   Future<void> _getLocationAndAddress() async {
//     setState(() {
//       isloading = true;
//     });
//     _currentLocation = await _getCurrentLocation();
//     MyPosition =
//         LatLng(_currentLocation!.latitude, _currentLocation!.longitude);
//     await _getAddressFromCoordinates();
//     setState(() {
//       MyPosition =
//           LatLng(_currentLocation!.latitude, _currentLocation!.longitude);
//       isloading = false;
//     });
//   }

//   Future<Position> _getCurrentLocation() async {
//     servicePermission = await Geolocator.isLocationServiceEnabled();
//     if (!servicePermission) {
//       print("Service Disabled");
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//     return await Geolocator.getCurrentPosition();
//   }

//   _getAddressFromCoordinates() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           _currentLocation!.latitude, _currentLocation!.longitude);
//       Placemark place = placemarks[0];

//       setState(() {
//         _currentAddress = "${place.locality}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text("MapBox Test"),
//         ),
//         body: isloading
//             ? CircularProgressIndicator()
//             : FlutterMap(
//                 options: MapOptions(
//                   center: MyPosition,
//                   minZoom: 5,
//                   maxZoom: 25,
//                   zoom: 18,
//                 ),
//                 nonRotatedChildren: [
//                   TileLayer(
//                     urlTemplate:
//                         'https://api.mapbox.com/styles/v1/mikaa29/clli29lel018l01p88sn6guvs/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWlrYWEyOSIsImEiOiJjbGxkcXBsNTQwYncyM2dxdjFqN2VuZGFwIn0.j5VpcKbH6WjqW0JiHfD-YQ',
//                     additionalOptions: {
//                       'accessToken': MAPBOX_ACCESS_TOKEN,
//                       'id': 'mapbox.mapbox-streets-v8',
//                     },
//                   ),
//                   MarkerLayer(
//                     markers: [
//                       Marker(
//                         point: MyPosition,
//                         builder: (context) {
//                           return Container(
//                             child: Icon(
//                               Icons.location_on,
//                               color: Colors.deepPurple,
//                               size: 40,
//                             ),
//                           );
//                         },
//                       )
//                     ],
//                   )
//                 ],
//               ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:variegata_project/pages/catalog_shop/alamat.dart';

import '../../common/widget/mapFunction.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoibWlrYWEyOSIsImEiOiJjbGxkcXBsNTQwYncyM2dxdjFqN2VuZGFwIn0.j5VpcKbH6WjqW0JiHfD-YQ';

class TambahAlamat extends StatefulWidget {
  const TambahAlamat({super.key});

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
      appBar: AppBar(
        centerTitle: true,
        title: Text("MapBox Test"),
      ),
      body: Center(
        child: isloading
            ? CircularProgressIndicator()
            : Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      center: MyPosition,
                      minZoom: 5,
                      maxZoom: 25,
                      zoom: 18,
                    ),
                    nonRotatedChildren: [
                      TileLayer(
                        urlTemplate:
                            'https://api.mapbox.com/styles/v1/mikaa29/clli29lel018l01p88sn6guvs/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWlrYWEyOSIsImEiOiJjbGxkcXBsNTQwYncyM2dxdjFqN2VuZGFwIn0.j5VpcKbH6WjqW0JiHfD-YQ',
                        additionalOptions: {
                          'accessToken': MAPBOX_ACCESS_TOKEN,
                          'id': 'mapbox.mapbox-streets-v8',
                        },
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: MyPosition,
                            builder: (context) {
                              return Container(
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.deepPurple,
                                  size: 40,
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Alamat(
                              currentAddress: _currentAddress,
                            )),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33),
                            color: Color(0xffa3bfae),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Pilih Lokasi",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
