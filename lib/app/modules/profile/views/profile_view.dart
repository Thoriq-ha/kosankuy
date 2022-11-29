import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileController>(() => ProfileController());
    return Scaffold(
      body: Column(
        children: [
          const CircleAvatar(
            radius: 48, // Image radius
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          MyButtonComponent.buttonFlat(context, () {
            controller.logout();
          }, text: 'Log Out'),
        ],
      ),
    );
  }
}
