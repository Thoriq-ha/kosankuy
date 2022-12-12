import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_button.dart';
import 'package:kosankuy/app/components/my_input.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/logo.png',
            height: 100,
          ),
          const SizedBox(
            height: 22,
          ),
          MyInputComponent.textOutline(
            (v) {
              controller.paramRegister['username'] = v;
            },
            context: context,
            hintText: 'username',
          ),
          const SizedBox(
            height: 22,
          ),
          MyInputComponent.textOutline(
            (v) {
              controller.paramRegister['nama'] = v;
            },
            context: context,
            hintText: 'nama',
          ),
          const SizedBox(
            height: 22,
          ),
          MyInputComponent.textOutline(
            (v) {
              controller.paramRegister['email'] = v;
            },
            context: context,
            hintText: 'email',
          ),
          const SizedBox(
            height: 22,
          ),
          MyInputComponent.textOutline(
            (v) {
              controller.paramRegister['nomor_hp'] = v;
            },
            context: context,
            hintText: 'no_telp',
          ),
          const SizedBox(
            height: 22,
          ),
          Obx(() {
            return MyInputComponent.textOutline(
              (v) {
                controller.paramRegister['password'] = v;
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
          const SizedBox(
            height: 22,
          ),
          Obx(() {
            return MyInputComponent.textOutline(
              (v) {
                controller.paramRegister['password_confirmation'] = v;
              },
              context: context,
              hintText: 'password confirmation',
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
            controller.register();
          }, text: 'Register'),
          MyButtonComponent.buttonOutline(context, () {
            Get.toNamed(Routes.AUTH);
          }, title: 'Login'),
        ],
      ),
    ));
  }
}
