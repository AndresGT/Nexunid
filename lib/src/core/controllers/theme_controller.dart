import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexunid/src/core/themes/app_theme.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();

  var currentThemeName = 'dark'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedTheme();
  }

  void _loadSavedTheme() {
    String? savedTheme = _box.read('themeName');

    if (savedTheme != null && AppThemes.collections.containsKey(savedTheme)) {
      currentThemeName.value = savedTheme;

      Future.microtask(
        () => Get.changeTheme(AppThemes.collections[savedTheme]!),
      );
    }
  }

  void changethemes(String themeName) {
    if (AppThemes.collections.containsKey(themeName)) {
      currentThemeName.value = themeName;
      _box.write('themeName', themeName);
      
      Get.changeTheme(AppThemes.collections[themeName]!);
    }
  }
}
