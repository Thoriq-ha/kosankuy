import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kosankuy/app/modules/home/views/tabhome_view.dart';
import 'package:kosankuy/app/modules/map/views/map_view.dart';
import 'package:kosankuy/app/modules/profile/views/profile_view.dart';

class HomeController extends GetxController {
  final currentIndex = 1.obs;
  List<BottomNavigationBarItem> itemMenu = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.wallet), label: 'Transsaction'),
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
}
