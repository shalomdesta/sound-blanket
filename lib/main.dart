import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound/widgets/home_page.dart';
import 'package:sound/widgets/spalsh_screen.dart';
import 'package:sound/widgets/theme_notifier.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), routes: {
      '/': (context) => const SplashScreen(),
      '/home_page': (context) => const HomePage(),
    });
  }
}
