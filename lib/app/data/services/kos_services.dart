import 'package:get/get.dart';
import 'package:kosankuy/app/config/api_config.dart';
import 'package:kosankuy/app/config/route_config.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';

class KosServices {
  static Future<Map<String, dynamic>> getDataKos(
      Map<String, dynamic> inputParams) async {
    Map<String, dynamic> result = {
      "is_valid": false,
      "message": "",
      "data": null
    };

    try {
      final dataApi = await Get.find<AppController>()
          .dio
          .post('${Api.route[RoutesApi.LIST_KOS]}', data: inputParams);

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
