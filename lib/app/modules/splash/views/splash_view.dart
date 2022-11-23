import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/global/controllers/app_controller.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(
        body: Center(
            child: Image.asset(
      'assets/logo.png',
      height: 100,
    )));
  }
}
