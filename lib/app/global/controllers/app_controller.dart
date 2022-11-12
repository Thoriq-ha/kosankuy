import 'package:get/get.dart';
import 'package:kosankuy/app/data/service_preferences.dart';
import 'package:kosankuy/app/routes/app_pages.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get capture the current user location
    LocationData _locationData = await _location.getLocation();
    LatLng currentLatLng =
        LatLng(_locationData.latitude!, _locationData.longitude!);

    // Store the user location in sharedPreferences
    ServicePreferences.pref.setDouble('latitude', _locationData.latitude!);
    ServicePreferences.pref.setDouble('longitude', _locationData.longitude!);

    Get.offAllNamed(Routes.HOME);
  }
}
