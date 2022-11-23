import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/config/logging.dart';
import 'package:kosankuy/app/data/services/service_preferences.dart';
import 'package:kosankuy/app/config/url_config.dart';
import 'package:kosankuy/app/routes/app_pages.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';

class AppController extends GetxController {
  final dio = Dio();
  User? user;

  // update on initial splash screen
  Future<void> updateToken() async {
    String token = user?.token ?? '';
    print(token);
    dio.options = BaseOptions(
        baseUrl: UrlConfig.BASE_URL,
        connectTimeout: 10000,
        receiveTimeout: 10000,
        headers: {"authorization": "Bearer $token"});
    dio.interceptors.add(Logging());
  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location location = Location();
    bool? serviceEnabled;
    PermissionStatus? permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    // // Get capture the current user location
    // LocationData locationData = await location.getLocation();
    // LatLng currentLatLng =
    //     LatLng(locationData.latitude!, locationData.longitude!);

    // // Store the user location in sharedPreferences
    // ServicePreferences.pref.setDouble('latitude', locationData.latitude!);
    // ServicePreferences.pref.setDouble('longitude', locationData.longitude!);
  }
}
