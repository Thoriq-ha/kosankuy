import 'package:get/get.dart';
import 'package:kosankuy/app/config/api_config.dart';
import 'package:kosankuy/app/config/route_config.dart';
import 'package:kosankuy/app/config/url_config.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';

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
}
