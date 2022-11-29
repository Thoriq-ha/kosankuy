import 'package:get/get.dart';

import '../controllers/detail_kos_controller.dart';

class DetailKosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKosController>(
      () => DetailKosController(),
    );
  }
}
