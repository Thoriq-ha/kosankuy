import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/components/my_input.dart';
import 'package:kosankuy/app/modules/home/controllers/home_controller.dart';
import 'package:kosankuy/app/routes/app_pages.dart';
import 'package:kosankuy/app/utils/num_formatter.dart';

class TabHomeView extends StatelessWidget {
  const TabHomeView();

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
          MyInputComponent.text((v) {
            controller.searchDataKos(v);
          }, context: context, hintText: 'Search'),
          Obx(() {
            if (controller.listKostView == []) {
              return const CircularProgressIndicator();
            }
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: controller.listKostView.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 24),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_KOS,
                            arguments: controller.listKostView[index]);
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
                                  controller.listKostView[index].gambar[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(controller.listKostView[index].namaKost),
                              Text(NumberFormatter.toRupiah(double.parse(
                                  controller.listKostView[index].harga)))
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
