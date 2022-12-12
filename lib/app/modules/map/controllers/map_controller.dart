import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_bottom_sheet.dart';
import 'package:kosankuy/app/data/models/kos_model.dart';
import 'package:kosankuy/app/data/services/kos_services.dart';
import 'package:kosankuy/app/routes/app_pages.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapController extends GetxController {
  MapboxMapController? mapboxMapController;
  List<Kos> listKost = [];

  Map<String, dynamic> points = {
    "type": "FeatureCollection",
    "features": [
      // {
      //   "type": "Feature",
      //   "id": 1,
      //   "properties": {"type": "lodging", "name": "kos 1"},
      //   "geometry": {
      //     "type": "Point",
      //     "coordinates": [-7.951810120108503, 112.60745865265773]
      //   }
      // }
    ]
  };

  @override
  void onInit() {
    super.onInit();
  }

  void getDataKos() async {
    listKost.clear();
    Map<String, dynamic> inputParam = {};
    var res = await KosServices.getDataKos(inputParam);
    var data = res['data'];

    if (res['is_valid']) {
      List<Kos> koss = (data as List).map((e) => Kos.fromJson(e)).toList();
      listKost.addAll(koss);
      addToPoints();
    } else {
      Get.snackbar('Error', res['message']);
    }
  }

  void addToPoints() {
    points['features'] = listKost
        .map((value) => {
              "type": "Feature",
              "id": value.id,
              "properties": {"type": "lodging", "name": value.namaKost},
              "geometry": {
                "type": "Point",
                "coordinates": [(value.longlat[0]), (value.longlat[1])]
              }
            })
        .toList();

    // (points['features'] as List).add([
    //   {
    //     "type": "Feature",
    //     "id": 2,
    //     "properties": {"type": "lodging", "name": "kos 1"},
    //     "geometry": {
    //       "type": "Point",
    //       "coordinates": [-7.951444, 112.607066]
    //     }
    //   },
    //   {
    //     "type": "Feature",
    //     "id": 3,
    //     "properties": {"type": "lodging", "name": "kos 1"},
    //     "geometry": {
    //       "type": "Point",
    //       "coordinates": [-7.951444, 112.607066]
    //     }
    //   }
    // ]);
  }

  // @override
  // void onClose() {
  //   mapboxMapController?.dispose();
  //   super.onClose();
  // }

  Future<void> onMapCreated(MapboxMapController controller) async {
    // mapboxMapController?.dispose();
    // onClose();
    if (controller != null) {
      mapboxMapController = controller;
      _onStyleLoadedCallback();
      mapboxMapController?.onFeatureTapped.add(_onFeatureTap);
    }
  }

  void _onFeatureTap(dynamic featureId, Point<double> point, LatLng latLng) {
    listKost.forEach((v) {
      if (v.id == int.tryParse(featureId)) {
        MyBottomSheet.show(
            text: v.namaKost,
            img: v.gambar[0],
            action: () {
              Get.toNamed(Routes.DETAIL_KOS, arguments: v);
            });
      }
    });
    // MyBottomSheet.show(text: featureId);
  }

  Future<void> _onStyleLoadedCallback() async {
    if (points['features'] != null) {
      await mapboxMapController?.addGeoJsonSource("points", points);
      await mapboxMapController?.addSymbolLayer(
        "points",
        "symbols",
        SymbolLayerProperties(
          textField: [Expressions.get, "name"],
          textHaloWidth: 1,
          textSize: 10,
          textHaloColor: Colors.white.toHexStringRGB(),
          textOffset: [
            Expressions.literal,
            [0, 2]
          ],
          iconImage: "{type}-11",
          iconSize: 2,
          iconAllowOverlap: true,
          textAllowOverlap: true,
        ),
      );
    }
  }
}
