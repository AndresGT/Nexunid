import 'package:get/get.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
