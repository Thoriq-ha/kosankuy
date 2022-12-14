import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_button.dart';
import 'package:kosankuy/app/components/my_input.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading.value == true) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            height: 100,
          ),
          const SizedBox(
            height: 22,
          ),
          MyInputComponent.textOutline(
            (v) {
              controller.paramLogin['identitas'] = v;
            },
            context: context,
            hintText: 'email',
          ),
          const SizedBox(
            height: 23,
          ),
          Obx(() {
            return MyInputComponent.textOutline(
              (v) {
                controller.paramLogin['password'] = v;
              },
              context: context,
              hintText: 'password',
              isPassword: controller.isPassword.value,
              sufixIcon: IconButton(
                  onPressed: () {
                    controller.isPassword.value = !controller.isPassword.value;
                  },
                  icon: Icon((controller.isPassword.value)
                      ? Icons.visibility
                      : Icons.visibility_off)),
            );
          }),
          MyButtonComponent.buttonFlat(context, () {
            controller.login();
          }, text: 'Login'),
          MyButtonComponent.buttonOutline(context, () {
            Get.toNamed(Routes.REGISTER);
          }, title: 'Register'),
        ],
      );
    }));
  }
}
