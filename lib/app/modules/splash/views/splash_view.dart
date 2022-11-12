import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<AppController>().initializeLocationAndSave();
    return const Scaffold(
      body: Center(
        child: Text(
          'SplashView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
