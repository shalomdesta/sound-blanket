import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);
  void themeNotifier() async {
    final SharedPreferences prefs = await _prefs;
    final theme = prefs.getString('theme');
    if (theme == 'dark') {
      value = ThemeMode.dark;
    } else if (theme == 'light') {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.system;
    }
    notifyListeners();
  }
}

void setTheme(ThemeMode currentTheme) async {
  final SharedPreferences prefs = await _prefs;

  if (currentTheme == ThemeMode.dark) {
    await prefs.setString('theme', 'dark');
  } else if (currentTheme == ThemeMode.light) {
    await prefs.setString('theme', 'light');
  } else if (currentTheme == ThemeMode.system) {
    await prefs.setString('theme', 'system');
  }
}
