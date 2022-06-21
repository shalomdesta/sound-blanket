import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

Future<void> getTheme() async {
  final SharedPreferences prefs = await _prefs;
  final theme = prefs.getString('theme');
  if (theme == 'dark') {
    themeNotifier.value = ThemeMode.dark;
  } else if (theme == 'light') {
    themeNotifier.value = ThemeMode.light;
  } else {
    themeNotifier.value = ThemeMode.system;
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
