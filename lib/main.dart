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
    final currentTheme = ref.watch(themeProvider) as ThemeMode;
    return MaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        home: FutureBuilder<ThemeMode>(future: ThemeNotifier().getTheme(),builder: (buildcontext, data){
          if (data.hasData)
  {return ThemeMode:data}

        },),
        routes: {
          '/': (context) => const SplashScreen(),
          '/home_page': (context) => const HomePage(),
        });
  }
}
