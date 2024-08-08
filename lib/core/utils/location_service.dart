import 'package:location/location.dart';

class LocationService {
  static Future<void> getCurrentUserLocation() async {
    Location location = Location();

    bool _serviceEnabled;
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

    print('permission dan oldin');
    _locationData = await location.getLocation();
    print('location ${_locationData.longitude}');
  }
}
