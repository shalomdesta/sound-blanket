import 'package:flex_color_scheme/flex_color_scheme.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ThemeMode> config = ref.watch(theme);
    return config.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (config) => MaterialApp(
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.hippieBlue),
          theme: FlexThemeData.light(scheme: FlexScheme.hippieBlue),
          themeMode: config,
          routes: {
            '/': (context) => const SplashScreen(),
            '/home_page': (context) => const HomePage(),
          }),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
