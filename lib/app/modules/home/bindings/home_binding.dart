import 'package:get/get.dart';
import 'package:kosankuy/app/modules/map/controllers/map_controller.dart';
import 'package:kosankuy/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<MapController>(
    //   () => MapController(),
    // );
    // Get.lazyPut<ProfileController>(
    //   () => ProfileController(),
    // );
  }
}
