import 'package:get/get.dart';
import 'package:kosankuy/app/data/services/auth_services.dart';
import 'package:kosankuy/app/data/services/service_preferences.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  Future<void> logout() async {
    Map<String, dynamic> paramLogin = {};
    var res = await AuthServices.logout(paramLogin);

    if (res['is_valid']) {
      ServicePreferences.pref.clear();
      Get.find<AppController>().updateToken();
      Get.offAllNamed(Routes.AUTH);
    }
  }
}
