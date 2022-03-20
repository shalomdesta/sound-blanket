import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void getTheme() async {
    final SharedPreferences prefs = await _prefs;
    String? currentTheme = prefs.getString('theme');
    if (currentTheme == 'light') {
      state = ThemeMode.light;
    } else if (currentTheme == 'dark') {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system;
    }
  }

  void setTheme(ThemeMode currentTheme) async {
    final SharedPreferences prefs = await _prefs;

    if (currentTheme == ThemeMode.dark) {
      await prefs.setString('theme', 'light');
      getTheme();
    } else if (currentTheme == ThemeMode.light) {
      await prefs.setString('theme', 'dark');
      getTheme();
    } else {
      await prefs.setString('theme', 'light');
      getTheme();
    }
  }
}
