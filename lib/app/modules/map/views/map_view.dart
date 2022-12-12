import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/modules/home/controllers/home_controller.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<MapController>(() => MapController());
    controller.getDataKos();
    LatLng uin = const LatLng(-7.951810120108503, 112.60745865265773);

    final HomeController homeController = Get.find();
    if (homeController.currentIndex.value != 1) {
      controller.dispose();
    }

    return Scaffold(
      appBar: MyAppBarComponent.buildNormalWithoutLeading(
          context, 'Map Page Pencarian Kos'),
      body: Stack(
        children: [
          MapboxMap(
            accessToken: dotenv.env['MAP_TOKEN'] ?? '',
            initialCameraPosition: CameraPosition(target: uin),
            onMapCreated: controller.onMapCreated,
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.Tracking,
            minMaxZoomPreference: const MinMaxZoomPreference(12, 14),
          ),
        ],
      ),
    );
  }
}
