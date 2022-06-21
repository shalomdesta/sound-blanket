import 'package:flutter/material.dart';
import 'package:sound/notifiers/theme_notifier.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({Key? key}) : super(key: key);

  @override
  ThemeSelectState createState() => ThemeSelectState();
}

class ThemeSelectState extends State<ThemeSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        onChanged: <ThemeMode>(value) async {
          setState(() {
            themeNotifier.value = value;
            setTheme(value);
          });
        },
        value: themeNotifier.value,
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
