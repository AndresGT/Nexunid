import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/layout/controllers/layout_controller.dart';
import 'package:nexunid/src/ui/shared/ui/widgets/side_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.put(LayoutController());
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.surface,

      body: Row(
        children: [
          SideBar(),
          Obx(() => Expanded(child: controller.currentPage)),
        ],
      ),
    );
  }
}
