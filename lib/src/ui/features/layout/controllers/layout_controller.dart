import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/home/views/home_view.dart';
import 'package:nexunid/src/ui/features/profile/views/profile_view.dart';

class LayoutController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> pages = const [
    HomeView(),
    ProfileView(),

    /*  HomePage(),
    ProfilePage(), */
  ];

  Widget get currentPage => pages[selectedIndex.value];
}
