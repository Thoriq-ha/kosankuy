import 'dart:convert';

import 'package:get/get.dart';
import 'package:kosankuy/app/data/models/user_model.dart';
import 'package:kosankuy/app/data/services/auth_services.dart';
import 'package:kosankuy/app/data/services/service_preferences.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  RxBool isPassword = true.obs;
  final AppController appController = Get.find();
  Map<String, dynamic> paramRegister = {
    'username': '',
    'nama': '',
    'email': '',
    'nomor_hp': '',
    'password': '',
    'password_confirmation': '',
  };
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> register() async {
    // {'identitas': 'admin@kos.id', 'password': 'password'}
    var res = await AuthServices.register(paramRegister);
    var data = res['data'];
    print(res['message']);
    if (res['is_valid']) {
      appController.user = User.fromJson(data['user']);
      appController.user?.token = data['token'];
      ServicePreferences.pref.clear();
      ServicePreferences.pref
          .setString('user', json.encode(appController.user?.toMap()));
      appController.updateToken();
      Get.offAllNamed(Routes.HOME);
    }
  }
}
