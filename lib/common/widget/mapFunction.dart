import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

Future<void> getLocationAndAddress(Function onLocationReceived) async {
  Position? currentLocation;
  try {
    currentLocation = await getCurrentLocation();
    final myPosition = LatLng(currentLocation.latitude, currentLocation.longitude);
    await getAddressFromCoordinates(currentLocation, myPosition, onLocationReceived);
  } catch (e) {
    print(e);
  }
}

Future<Position> getCurrentLocation() async {
  bool servicePermission = await Geolocator.isLocationServiceEnabled();
  if (!servicePermission) {
    print("Service Disabled");
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }
  return await Geolocator.getCurrentPosition();
}

Future<void> getAddressFromCoordinates(Position position, LatLng myPosition, Function onAddressReceived) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    final currentAddress = "${place.locality}";
    onAddressReceived(myPosition, currentAddress);
  } catch (e) {
    print(e);
  }
}
