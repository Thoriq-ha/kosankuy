import 'dart:convert';

import 'package:get/get.dart';
import 'package:kosankuy/app/data/models/user_model.dart';
import 'package:kosankuy/app/data/services/auth_services.dart';
import 'package:kosankuy/app/data/services/service_preferences.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

class AuthController extends GetxController {
  RxBool isPassword = true.obs;
  RxBool isLoading = false.obs;
  final AppController appController = Get.find();
  Map<String, dynamic> paramLogin = {
    'identitas': '',
    'password': '',
  };
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    // {'identitas': 'admin@kos.id', 'password': 'password'}
    isLoading.value = true;
    var res = await AuthServices.login(paramLogin);
    var data = res['data'];
    if (res['is_valid']) {
      appController.user = User.fromJson(data['user']);
      appController.user?.token = data['token'];
      ServicePreferences.pref.clear();
      ServicePreferences.pref
          .setString('user', json.encode(appController.user?.toMap()));
      appController.updateToken();
      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } else {
      isLoading.value = false;
    }
  }
}
