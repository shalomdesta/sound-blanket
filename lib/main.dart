import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:sound/services/service_locator.dart';
import 'package:sound/widgets/home_page.dart';
import 'package:sound/widgets/spalsh_screen.dart';
import 'package:sound/notifiers/theme_notifier.dart';

main() async {
  await setupServiceLocator();
  await getTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
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
