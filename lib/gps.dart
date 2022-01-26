import 'package:location/location.dart';

Future<LocationData> checkLocationStatus() async {
  Location location = new Location();

  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return LocationData.fromMap({'latitude': 5, 'longitutde': 5});
    }
  }

  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return LocationData.fromMap({'latitude': 5, 'longitutde': 5});
    }
  }

  locationData = await location.getLocation();
  print("Latitude -> ${locationData.latitude}");
  print("Longitude -> ${locationData.longitude}");
  return locationData;
}
