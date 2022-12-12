import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/data/models/kos_model.dart';
import 'package:kosankuy/app/data/services/kos_services.dart';
import 'package:kosankuy/app/modules/home/views/tabhome_view.dart';
import 'package:kosankuy/app/modules/map/views/map_view.dart';
import 'package:kosankuy/app/modules/profile/views/profile_view.dart';

class HomeController extends GetxController {
  RxList<Kos> listKostView = RxList();
  RxList<Kos> listKost = RxList();

  final currentIndex = 0.obs;
  List<BottomNavigationBarItem> itemMenu = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.share_location_outlined), label: 'Map'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Profile'),
  ];

  List<Widget> screenMenu = [
    const TabHomeView(),
    const MapView(),
    const ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  void getDataKos() async {
    listKostView.clear();
    Map<String, dynamic> inputParam = {};
    var res = await KosServices.getDataKos(inputParam);
    var data = res['data'];

    if (res['is_valid']) {
      List<Kos> koss = (data as List).map((e) => Kos.fromJson(e)).toList();
      listKostView.addAll(koss);
      listKost.addAll(koss);
    } else {
      Get.snackbar('Error', res['message']);
    }
  }

  void searchDataKos(String query) async {
    listKostView.clear();
    List<Kos> koss = listKost
        .where((element) =>
            element.namaKost.toLowerCase().contains(query.toLowerCase()))
        .toList();
    listKostView.addAll(koss);
    update();
  }
}
