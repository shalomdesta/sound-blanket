import 'package:audio_service/audio_service.dart';
import 'package:sound/notifiers/play_notifier.dart';

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
  MyAudioHandler() {
    _notiftyAudioHandler();
  }

  _notiftyAudioHandler() {
    playNotifeir.addListener(() {
      playbackState.add(playbackState.value.copyWith(
        controls: [
          if (playNotifeir.value) MediaControl.pause else MediaControl.play
        ],
        playing: playNotifeir.value,
        androidCompactActionIndices: const [0],
        processingState: AudioProcessingState.ready,
      ));
    });
  }

  @override
  Future<void> play() {
    playNotifeir.value = true;
    return super.play();
  }

  @override
  Future<void> pause() {
    playNotifeir.value = false;
    return super.pause();
  }
}
