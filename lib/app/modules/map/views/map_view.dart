import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/components/my_button.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<MapController>(
      MapController(),
    );
    LatLng uin = const LatLng(-7.951810120108503, 112.60745865265773);
    controller.getDataKos();
    return Scaffold(
      appBar: MyAppBarComponent.buildNormalWithoutLeading(
          context, 'Map Page Pencarian Kos'),
      body: Stack(
        children: [
          MapboxMap(
            accessToken:
                'pk.eyJ1IjoidHVnYXNnaXMiLCJhIjoiY2xhN2lhMmFmMGE5YzNwbXF1ZndrYXZxMiJ9.iq8WZei4wimaaZf7tYZzYw',
            initialCameraPosition: CameraPosition(target: uin),
            onMapCreated: controller.onMapCreated,
            myLocationEnabled: true,
            myLocationTrackingMode: MyLocationTrackingMode.Tracking,
            // minMaxZoomPreference: const MinMaxZoomPreference(5, 17),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MyButtonComponent.buttonFlat(context, () {
                // Get.snackbar('User 123', 'Successfully created',
                //     snackPosition: SnackPosition.BOTTOM,
                //     margin: const EdgeInsets.all(0),
                //     borderRadius: 0);
              }, text: 'Bayar Sekarang'),
            ),
          )
        ],
      ),
    );
  }
}
