import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _box = GetStorage();
  var currentLocale = (Get.deviceLocale ?? const Locale('en', 'US')).obs;

  @override
  void onInit() {
    super.onInit();
    _loadSaveLanguage();
  }

  void _loadSaveLanguage() {
    String? savedLanguageCode = _box.read('languageCode');
    String? savedCountryCode = _box.read('countryCode');

    if (savedLanguageCode != null && savedCountryCode != null) {
      currentLocale.value = Locale(savedLanguageCode, savedCountryCode);
      Get.updateLocale(currentLocale.value);
    }
  }

  void changeLanguage(String languageCode, String countryCode) {
    currentLocale.value = Locale(languageCode, countryCode);

    _box.write('languageCode', languageCode);
    _box.write('countryCode', countryCode);
    Get.updateLocale(currentLocale.value);
  }
}
