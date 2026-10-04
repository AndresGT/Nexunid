import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexunid/src/core/controllers/language_controller.dart';
import 'package:nexunid/src/core/controllers/theme_controller.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  Get.put(LanguageController());
  Get.put(ThemeController());

  runApp(const App());
}
