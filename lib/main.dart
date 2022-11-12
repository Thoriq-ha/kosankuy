import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/data/service_preferences.dart';
import 'package:kosankuy/app/global/bindings/app_binding.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicePreferences.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
    ),
  );
}
