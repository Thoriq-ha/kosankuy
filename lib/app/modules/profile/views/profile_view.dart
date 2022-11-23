import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put<ProfileController>(
      ProfileController(),
    );
    return Scaffold(
      body: Center(
        child: MyButtonComponent.buttonFlat(context, () {
          controller.logout();
        }, text: 'Log Out'),
      ),
    );
  }
}
