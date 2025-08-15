import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/splash/controllers/splash_controller.dart';

class SplshBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
