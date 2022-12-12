import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/config/api_config.dart';
import 'package:kosankuy/app/config/route_config.dart';
import 'package:kosankuy/app/config/url_config.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';
import 'package:dio/dio.dart' as dio;

class AuthServices {
  static Future<Map<String, dynamic>> login(
      Map<String, dynamic> inputParams) async {
    Map<String, dynamic> result = {
      "is_valid": false,
      "message": "",
      "data": null
    };

    try {
      final dataApi = await Get.find<AppController>()
          .dio
          .post('${Api.route[RoutesApi.LOGIN]}', data: inputParams);

      if (dataApi.statusCode == 200) {
        result = dataApi.data;
        result['is_valid'] = true;
        print(result);
      }
    } catch (e) {
      result['message'] = e.toString();
    }

    return result;
  }

  static Future<Map<String, dynamic>> register(
      Map<String, dynamic> inputParams) async {
    Map<String, dynamic> result = {
      "is_valid": false,
      "message": "",
      "data": null
    };

    try {
      final dataApi = await Get.find<AppController>().dio.post(
          '${Api.route[RoutesApi.REGISTER]}',
          data: dio.FormData.fromMap(inputParams));

      if (dataApi.statusCode == 200) {
        result = dataApi.data;
        result['is_valid'] = true;
        print(result);
      }
    } catch (e) {
      if (e is DioError) {
        result['message'] = e.response?.data;
      } else {
        result['message'] = e.toString();
      }
    }

    return result;
  }

  static Future<Map<String, dynamic>> logout(
      Map<String, dynamic> inputParams) async {
    Map<String, dynamic> result = {
      "is_valid": true,
      "message": "",
      "data": null
    };

    try {
      final dataApi = await Get.find<AppController>()
          .dio
          .post(Api.route[RoutesApi.LOGOUT], data: inputParams);

      if (dataApi.statusCode == 200) {
        result = dataApi.data;
        result['is_valid'] = true;
      }
    } catch (e) {
      result['message'] = e.toString();
    }

    return result;
  }
}
