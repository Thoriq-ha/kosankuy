import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  late MapboxMapController mapboxMapController;

  HomeView({Key? key}) : super(key: key);

  _onMapCreated(MapboxMapController controller) async {
    this.mapboxMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    List<LatLng> restaurants = [
      const LatLng(-7.951810120108502, 112.60745865265771),
      const LatLng(-7.951810120108505, 112.60745865265774),
    ];

    List<CameraPosition> _kRestaurantsList =
        (restaurants.map((v) => CameraPosition(target: v, zoom: 15)).toList());
    LatLng uin = const LatLng(-7.951810120108503, 112.60745865265773);

    _onStyleLoadedCallback() async {
      for (CameraPosition _kRestaurant in _kRestaurantsList) {
        await mapboxMapController.addSymbol(
          SymbolOptions(
            geometry: _kRestaurant.target,
            iconSize: 0.2,
            iconImage: "assets/icon/food.png",
          ),
        );

        // Map geometry = getGeometryFromSharedPrefs(carouselData[index]['index']);
        final _fills = {
          "type": "FeatureCollection",
          "features": [
            {
              "type": "Feature",
              "id": 0,
              "properties": <String, dynamic>{},
              "geometry": {
                "coordinates": [
                  [-7.455822, 4.369882],
                  [-7.455822, 4.369882]
                ],
                "type": "LineString"
              },
            },
          ],
        };

        await mapboxMapController.addSource(
            "fills", GeojsonSourceProperties(data: _fills));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('SIG Pencarian Kos')),
      body: Center(
        child: MapboxMap(
          accessToken:
              'pk.eyJ1IjoidHVnYXNnaXMiLCJhIjoiY2xhN2lhMmFmMGE5YzNwbXF1ZndrYXZxMiJ9.iq8WZei4wimaaZf7tYZzYw',
          initialCameraPosition: CameraPosition(target: uin),
          // onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          // onStyleLoadedCallback: _onStyleLoadedCallback,
          myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
          minMaxZoomPreference: const MinMaxZoomPreference(14, 17),
        ),
      ),
    );
  }
}
