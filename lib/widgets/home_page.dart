import 'package:audio_service/audio_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sound/const/sounds_data.dart';
import 'package:sound/notifiers/play_notifier.dart';
import 'package:sound/services/service_locator.dart';
import 'package:sound/widgets/settings_widget.dart';
import 'package:sound/widgets/slider.dart';

final _audioHandler = getIt<AudioHandler>();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => showDialog(
                        context: context, builder: (_) => const Settings()),
                    icon: const Icon(
                      Icons.settings,
                      size: 35,
                    ),
                  ),
                  StreamBuilder<PlaybackState>(
                      stream: _audioHandler.playbackState.distinct(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.data!.playing != playNotifeir.value) {
                          playNotifeir.value = snapshot.data!.playing;
                        }

                        return playNotifeir.value
                            ? IconButton(
                                onPressed: (() => setState(() {
                                      playNotifeir.value = false;
                                      print(playNotifeir.value);
                                    })),
                                icon: const Icon(
                                  Icons.pause_rounded,
                                  size: 50,
                                ),
                              )
                            : IconButton(
                                onPressed: (() => setState(() {
                                      playNotifeir.value = true;
                                      print(playNotifeir.value);
                                    })),
                                icon: const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50,
                                ),
                              );
                      }),
                ]),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => SliderContainer(
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
