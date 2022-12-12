import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kosankuy/app/components/my_appbar.dart';
import 'package:kosankuy/app/components/my_button.dart';
import 'package:kosankuy/app/components/my_label.dart';
import 'package:kosankuy/app/data/models/kos_model.dart';
import 'package:kosankuy/app/routes/app_pages.dart';
import 'package:kosankuy/app/utils/num_formatter.dart';

import '../controllers/detail_kos_controller.dart';

class DetailKosView extends GetView<DetailKosController> {
  const DetailKosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Kos kos = Get.arguments;
    return Scaffold(
        appBar: MyAppBarComponent.buildNormal(context, 'Detail Kos'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(kos.gambar[0],
                  width: double.infinity, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 24),
              MyLabelComponent.show(
                  text: kos.namaKost,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              Divider(),
              const SizedBox(height: 12),
              MyLabelComponent.show(text: kos.deskripsi),
              Expanded(child: Container()),
              MyLabelComponent.show(
                  text: NumberFormatter.toRupiah(double.parse(kos.harga))),
              MyButtonComponent.buttonFlat(context, () {
                Get.toNamed(Routes.MAP);
              }, text: 'Lihat Peta'),
              const SizedBox(
                height: 36,
              )
            ],
          ),
        ));
  }
}
