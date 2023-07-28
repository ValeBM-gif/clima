import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    print('permiso? $permission');
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print('posición? $position');
    } catch (e) {
      print('nadota, $e');
    }
  }
}
