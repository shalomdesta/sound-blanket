import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound/const/sounds_data.dart';
import 'package:sound/widgets/slider.dart';
import 'package:sound/widgets/theme_notifier.dart';
import 'dart:developer' as dev;

final playProvider = StateProvider<bool>((ref) => false);
final themeProvider = StateNotifierProvider((ref) {
  return ThemeNotifier();
});

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  IconData iconSelect() {
    if (ref.watch(playProvider) == true) {
      return Icons.pause_rounded;
    } else {
      return Icons.play_arrow_rounded;
    }
  }

  var data = Data.data.map((e) {
    return SliderContainer(
      icon: e.icon!,
      sound: e.sound!,
      name: e.name!,
    );
  }).toList();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    ThemeNotifier().getTheme();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider) as ThemeMode;
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: currentTheme,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 60,
              left: MediaQuery.of(context).size.width - 50,
              child: InkWell(
                onTap: () {
                  ref.read(themeProvider.notifier).setTheme(currentTheme);
                  dev.log(ref.watch(themeProvider).toString());
                },
                child: const Icon(
                  Icons.settings,
                  size: 35,
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: InkWell(
                onTap: () => ref.read(playProvider.notifier).state =
                    !ref.watch(playProvider.notifier).state,
                child: Icon(
                  iconSelect(),
                  size: 50,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.05,
              top: 100,
              bottom: 0,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [...data],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
