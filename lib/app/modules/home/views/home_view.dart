import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/components/my_bottom_nav.dart';
import 'package:kosankuy/app/components/my_button.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screenMenu[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        return MyBottomNavComponent.build(
          context,
          (value) {
            controller.currentIndex.value = value;
          },
          listItems: controller.itemMenu,
          currentIndex: controller.currentIndex.value,
        );
      }),
    );
  }
}
