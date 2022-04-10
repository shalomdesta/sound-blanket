import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound/widgets/theme_notifier.dart';

import 'home_page.dart';

class ThemeSelect extends ConsumerStatefulWidget {
  const ThemeSelect({Key? key}) : super(key: key);

  @override
  ThemeSelectState createState() => ThemeSelectState();
}

class ThemeSelectState extends ConsumerState<ThemeSelect> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        onChanged: <ThemeMode>(value) =>
            ref.read(themeProvider.notifier).setTheme(value),
        value: ref.watch(themeProvider),
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
