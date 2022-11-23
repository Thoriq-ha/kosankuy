import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapController extends GetxController {
  MapboxMapController? mapboxMapController;
  final List<CameraPosition> _kRestaurantsList = [];
  List<LatLng> restaurants = [
    const LatLng(-7.940595, 112.609230),
    const LatLng(-7.951810120108505, 112.60745865265774),
  ];

  @override
  void onInit() {
    _kRestaurantsList.addAll(
        (restaurants.map((v) => CameraPosition(target: v, zoom: 15)).toList()));
    super.onInit();
  }

  void onMapCreated(MapboxMapController controller) {
    mapboxMapController = controller;
    onStyleLoadedCallback();
  }

  Future<void> onStyleLoadedCallback() async {
    final ByteData bytes = await rootBundle.load('assets/logo.png');
    final Uint8List list = bytes.buffer.asUint8List();

    mapboxMapController?.addImageSource(
      '1',
      list,
      const LatLngQuad(
        bottomRight: LatLng(-33.86264728692581, 151.19916915893555),
        bottomLeft: LatLng(-33.86264728692581, 151.2288236618042),
        topLeft: LatLng(-33.84322353475214, 151.2288236618042),
        topRight: LatLng(-33.84322353475214, 151.19916915893555),
      ),
    );

    // for (CameraPosition kRestaurant in _kRestaurantsList) {
    //   mapboxMapController?.addSymbol(
    //     SymbolOptions(
    //       geometry: kRestaurant.target,
    //       iconSize: 0.2,
    //       iconImage: "assets/logo.png",
    //     ),
    //   );

    //   // Map geometry = getGeometryFromSharedPrefs(carouselData[index]['index']);
    //   final fills = {
    //     "type": "FeatureCollection",
    //     "features": [
    //       {
    //         "type": "Feature",
    //         "id": 0,
    //         "properties": <String, dynamic>{},
    //         "geometry": {
    //           "coordinates": [
    //             [kRestaurant.target.latitude, kRestaurant.target.longitude],
    //           ],
    //           "type": "LineString"
    //         },
    //       },
    //     ],
    //   };

    //   mapboxMapController?.addSource(
    //       "fills", GeojsonSourceProperties(data: fills));
    // }
  }
}
