import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sound/const/sounds_data.dart';
import 'package:sound/widgets/settings_widget.dart';
import 'package:sound/widgets/slider.dart';
import 'package:sound/widgets/theme_notifier.dart';

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
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

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
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SafeArea(
              child: Row(
                children: [
                  InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => const Settings()),
                    child: const Icon(
                      Icons.settings,
                      size: 35,
                    ),
                  ),
                  InkWell(
                    onTap: () => ref.read(playProvider.notifier).state =
                        !ref.watch(playProvider.notifier).state,
                    child: Icon(
                      ref.watch(playProvider)
                          ? Icons.pause_rounded
                          : Icons.play_arrow_rounded,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => SliderContainer(
                  icon: data[index]['icon']!,
                  name: data[index]['name']!,
                  sound: data[index]['sound']!,
                ),
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: data.length,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
