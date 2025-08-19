import 'package:get/get.dart';
import 'package:nexunid/src/ui/features/layout/controllers/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutController>(() => LayoutController());
  }
}
