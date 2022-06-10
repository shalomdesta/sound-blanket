import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sound/services/service_locator.dart';
import 'package:sound/widgets/home_page.dart';
import 'package:sound/widgets/spalsh_screen.dart';
import 'package:sound/notifiers/theme_notifier.dart';

main() async {
  await setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final themeMode = ThemeNotifier();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeMode,
        builder: (context, theme, _) {
          return MaterialApp(
              darkTheme: FlexThemeData.dark(scheme: FlexScheme.hippieBlue),
              theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue),
              themeMode: theme,
              routes: {
                '/': (context) => const SplashScreen(),
                '/home_page': (context) => const HomePage(),
              });
        });
  }
}
