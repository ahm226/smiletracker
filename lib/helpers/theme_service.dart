import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'themeMode';

  bool get isDarkMode => _loadThemeFromStorage();

  ThemeMode get theme => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToStorage(!isDarkMode);
  }

  bool _loadThemeFromStorage() => _box.read(_key) ?? false;

  void _saveThemeToStorage(bool isDarkMode) => _box.write(_key, isDarkMode);
}
