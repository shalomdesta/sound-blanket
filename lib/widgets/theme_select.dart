import 'package:flutter/material.dart';
import 'package:sound/notifiers/theme_notifier.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({Key? key}) : super(key: key);

  @override
  ThemeSelectState createState() => ThemeSelectState();
}

final themeMode = ThemeNotifier();

class ThemeSelectState extends State<ThemeSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        onChanged: <ThemeMode>(value) async {
          setState(() {
            themeMode.value = value;
            setTheme(themeMode.value);
            themeMode.themeNotifier();
          });
        },
        value: themeMode.value,
        items: ThemeMode.values
            .map<DropdownMenuItem<ThemeMode>>(
              (e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ),
            )
            .toList());
  }
}
