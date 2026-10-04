import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexunid/src/core/bindings/app_binding.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';
import 'package:nexunid/src/core/languages/app_translation.dart';
import 'package:nexunid/src/core/routes/app_routes.dart';
import 'package:nexunid/src/core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nexunid',
        initialBinding: AppBinding(),
        theme: AppThemes.collections['dark'],
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.appRoutes(),
        translations: AppTranslations(),
        locale: Get.find<LanguageController>().currentLocale.value,
        fallbackLocale: Locale('es', 'ES'),
      ),
    );
  }
}
