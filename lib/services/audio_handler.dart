import 'package:audio_service/audio_service.dart';
import 'package:sound/notifiers/play_notifier.dart';
import 'package:sound/services/service_locator.dart';

final _audioHandler = getIt<AudioHandler>();

Future<AudioHandler> initAudioService() async {
  return await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.shalomd.sound.audio',
      androidNotificationChannelName: 'Audio Service Demo',
      androidNotificationOngoing: true,
      androidStopForegroundOnPause: true,
    ),
  );
}

class MyAudioHandler extends BaseAudioHandler {
  @override
  Future<void> play() async {
    playbackState.add(playbackState.value
        .copyWith(playing: true, controls: [MediaControl.pause]));
    playNotifeir.value = !playNotifeir.value;
  }

  @override
  Future<void> pause() async {
    playbackState.add(playbackState.value
        .copyWith(playing: false, controls: [MediaControl.play]));
    playNotifeir.value = !playNotifeir.value;
  }

  void dispose() {
    _audioHandler.customAction('dispose');
  }

  void init() {}
}
