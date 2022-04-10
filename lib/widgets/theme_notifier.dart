import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setTheme(ThemeMode currentTheme) async {
    final SharedPreferences prefs = await _prefs;

    if (currentTheme == ThemeMode.dark) {
      await prefs.setString('theme', 'dark');
      state = ThemeMode.dark;
    } else if (currentTheme == ThemeMode.light) {
      await prefs.setString('theme', 'light');
      state = ThemeMode.light;
    } else if (currentTheme == ThemeMode.system) {
      await prefs.setString('theme', 'system');
      state = ThemeMode.system;
    }
  }

  Future<ThemeMode> getTheme() async {
    final SharedPreferences prefs = await _prefs;
    final theme = prefs.getString('theme');
    if (theme == 'dark') {
      return ThemeMode.dark;
    } else if (theme == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }
}
