import 'package:location/location.dart';

class LocationService {
  static late final double latitude;
  static late final double longitude;

  static Future<void> getCurrentUserLocation() async {
    Location location = Location();

    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _permissionGranted = await location.hasPermission();
    print('permission $_permissionGranted');
    if (_permissionGranted == PermissionStatus.denied) {
      print('first if');
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('second if');
        return;
      }
    }

    _locationData = await location.getLocation();
    print('after location got');
    latitude = _locationData.latitude!;
    longitude = _locationData.longitude!;
  }
}
