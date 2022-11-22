import 'dart:convert';

import 'package:get/get.dart';
import 'package:kosankuy/app/data/models/user_model.dart';
import 'package:kosankuy/app/data/services/service_preferences.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final AppController appController = Get.find();

  @override
  void onReady() {
    runCode();
    super.onReady();
  }

  getInitialPage() {
    var user = ServicePreferences.pref.getString('user');
    if (user != null) {
      appController.user = User.fromJson(json.decode(user));
      appController.updateToken();
      // Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.AUTH);
    }
  }

  Future<void> runCode() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      getInitialPage();
    });
  }
}
