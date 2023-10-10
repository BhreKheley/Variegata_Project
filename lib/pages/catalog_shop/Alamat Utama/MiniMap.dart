import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:variegata_project/pages/catalog_shop/Alamat%20Utama/AddAlamat.dart';

import '../../../common/widget/mapFunction.dart';

const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoibWlrYWEyOSIsImEiOiJjbGxkcXBsNTQwYncyM2dxdjFqN2VuZGFwIn0.j5VpcKbH6WjqW0JiHfD-YQ';

class MapAlamat extends StatefulWidget {

  @override
  State<MapAlamat> createState() => _MapAlamatState();
}

class _MapAlamatState extends State<MapAlamat> {
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
                minZoom: 1,
                maxZoom: 35,
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
                            color: Colors.red,
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
                      MaterialPageRoute(
                        builder: (context) => AddAlamat(
                          currentAddress: _currentAddress,
                        ),
                      ),
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
