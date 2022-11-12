import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kosankuy/app/data/requests/dio_exceptions.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

String baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
String accessToken =
    'pk.eyJ1IjoidHVnYXNnaXMiLCJhIjoiY2xhN2lhMmFmMGE5YzNwbXF1ZndrYXZxMiJ9.iq8WZei4wimaaZf7tYZzYw';
String navType = 'cycling';

Dio _dio = Dio();

Future getCyclingRouteUsingMapbox(LatLng source, LatLng destination) async {
  String url =
      '$baseUrl/$navType/${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}?alternatives=true&continue_straight=true&geometries=geojson&language=en&overview=full&steps=true&access_token=$accessToken';
  try {
    _dio.options.contentType = Headers.jsonContentType;
    final responseData = await _dio.get(url);
    return responseData.data;
  } catch (e) {
    final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
    debugPrint(errorMessage);
  }
}
