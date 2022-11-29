import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_bottom_nav.dart';
import 'package:kosankuy/app/modules/map/controllers/map_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => controller.screenMenu[controller.currentIndex.value]),
          // CircularProgressIndicator()
        ],
      ),
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
