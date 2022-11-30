import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_color.dart';
import 'package:kosankuy/app/components/my_label.dart';

class MyBottomSheet {
  static Future<dynamic> show(
      {required String text, required String img, Function? action}) {
    return Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              Image.network(img,
                  height: 200, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 24),
              MyLabelComponent.show(text: text),
              const SizedBox(height: 24),
              itemMenu(onAction: action, label: "Detail"),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      backgroundColor: MyColor.hexToColor(MyColor.backgroundApps),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(48), topRight: Radius.circular(48))),
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
    );
  }

  static Widget itemMenu({required onAction, required label, var color}) {
    return GestureDetector(
      onTap: onAction,
      child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: MyLabelComponent.show(text: label)),
    );
  }
}
