import 'package:get/get.dart';

import '../controllers/language_controller.dart';
import '../controllers/theme_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(LanguageController(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
