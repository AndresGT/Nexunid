import 'package:get/get.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';
import 'package:nexunid/src/core/controllers/theme_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
