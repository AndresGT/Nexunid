import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/core/bindings/app_binding.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';
import 'package:nexunid/src/core/controllers/theme_controller.dart';
import 'package:nexunid/src/core/languages/app_traslation.dart';
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
        initialRoute: Routes.home ,
        getPages: Routes.appRoutes(),
        translations: AppTranslations(),
        locale: Get.find<LanguageController>().currentLocale.value,
        fallbackLocale: Locale('es', 'ES'),
      ),
    );
  }
}
