import 'package:flutter/material.dart';
import 'package:sound/const/sounds_data.dart';
import 'package:sound/notifiers/play_notifier.dart';
import 'package:sound/widgets/settings_widget.dart';
import 'package:sound/widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => showDialog(
                      context: context, builder: (_) => const Settings()),
                  child: const Icon(
                    Icons.settings,
                    size: 35,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      playNotifeir.value = !playNotifeir.value;
                    });
                  },
                  child: Icon(
                    playNotifeir.value
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
    );
  }
}
