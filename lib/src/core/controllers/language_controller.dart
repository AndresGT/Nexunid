import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final _box = GetStorage(); // Almacenamiento local para persistencia
  var currentLocale = Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage(); // Cargar idioma guardado al iniciar
  }

  // Método para cargar el idioma guardado al iniciar la app
  void _loadSavedLanguage() {
    String? savedLanguageCode = _box.read('languageCode');
    String? savedCountryCode = _box.read('countryCode');

    if (savedLanguageCode != null && savedCountryCode != null) {
      currentLocale.value = Locale(savedLanguageCode, savedCountryCode);
      Get.updateLocale(currentLocale.value); // Actualizar el idioma en la app
    }
  }

  // Método para cambiar el idioma de la app
  void changeLanguage(String languageCode, String countryCode) {
    currentLocale.value = Locale(languageCode, countryCode);
    
    // Guardar la configuración en almacenamiento local
    _box.write('languageCode', languageCode);
    _box.write('countryCode', countryCode);
    
    Get.updateLocale(currentLocale.value); // Aplicar el cambio de idioma en la app
  }
}
