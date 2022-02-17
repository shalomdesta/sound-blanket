import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late bool themePref;

  void setPref(value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('theme', value);
  }

  void getPref() async {
    final SharedPreferences prefs = await _prefs;
    themePref = (prefs.getBool('theme') ?? false);
  }
}
