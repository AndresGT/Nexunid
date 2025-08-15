import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nexunid/src/core/themes/app_theme.dart';

/// A [GetxController] for managing the application's theme.
///
/// It handles switching between light and dark mode and persists
/// the user's selection across sessions using [GetStorage].
class ThemeController extends GetxController {
  /// An instance of [GetStorage] for persistent local storage.
  /// It is used to save and read the user's theme preference.
  final _box = GetStorage();

  /// The key used to store the theme state in [GetStorage].
  /// Using a constant prevents typos.
  final _key = 'isDarkMode';

  /// A reactive (`RxBool`) variable that holds the current theme state.
  ///
  /// `true` for dark mode, `false` for light mode.
  /// Being an `.obs` variable, widgets that use it will automatically
  /// rebuild when its value changes.
  var isDarkMode = false.obs;

  /// A GetX lifecycle method called when the controller is initialized.
  ///
  /// It loads the user's saved theme preference from [GetStorage].
  /// If no preference is saved (e.g., the first time the app is opened),
  /// it defaults to light mode (`false`).
  @override
  void onInit() {
    super.onInit();
    // Reads the saved value; if it's null, it returns false.
    isDarkMode.value = _box.read(_key) ?? false;
  }

  /// Toggles the current theme between light and dark mode.
  ///
  /// It inverts the boolean value of [isDarkMode] and saves the new state
  /// to [GetStorage] to ensure persistence.
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _box.write(_key, isDarkMode.value);
    // The call to update() is not necessary here because isDarkMode is an .obs,
    // and widgets that use it will update automatically.
  }

  /// A getter that returns the appropriate `ThemeData` for the current mode.
  ///
  /// This is used by `GetMaterialApp` to apply the theme globally.
  /// Returns [AppThemes.darkTheme] if [isDarkMode] is true,
  /// otherwise, it returns [AppThemes.lightTheme].
  ThemeData get theme =>
      isDarkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme;
}
