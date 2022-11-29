import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/components/my_input.dart';
import 'package:kosankuy/app/modules/home/controllers/home_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';

class TabHomeView extends StatelessWidget {
  const TabHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    controller.getDataKos();
    return Scaffold(
      appBar: MyAppBarComponent.buildNormalWithoutLeading(
          context, 'SIG Pencarian Kos'),
      body: Column(
        children: [
          const SizedBox(height: 12),
          MyInputComponent.text((v) {}, context: context, hintText: 'Search'),
          Obx(() {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: controller.listKost.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 24),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_KOS,
                            arguments: controller.listKost[index]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: Image.network(
                                  controller.listKost[index].gambar[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(controller.listKost[index].namaKost),
                              Text(controller.listKost[index].harga)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
