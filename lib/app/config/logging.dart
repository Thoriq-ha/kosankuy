import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      'RESPONSE[${response.statusCode}] => DATA: ${response.data}',
    );

    // printPrettyJson(jsonData: response.data);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} \nPATH: ${err.response?.data}',
    );
    return super.onError(err, handler);
  }

  void printPrettyJson({required Object jsonData}) {
    var encoder = const JsonEncoder.withIndent('  ');
    log(encoder.convert(jsonData));
  }
}
