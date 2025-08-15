import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/core/bindings/app_binding.dart';
import 'package:nexunid/src/core/controllers/theme_controller.dart';
import 'package:nexunid/src/core/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexunid',
        theme: Get.find<ThemeController>().theme,
        themeMode: Get.find<ThemeController>().isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        initialBinding: AppBinding(),
        initialRoute: Routes.splash,
        getPages: Routes.appRoutes(),
      ),
    );
  }
}
