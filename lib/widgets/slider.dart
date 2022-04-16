import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'home_page.dart';

class SliderContainer extends ConsumerStatefulWidget {
  const SliderContainer(
      {Key? key, required this.icon, required this.sound, required this.name})
      : super(key: key);
  final String icon;
  final String sound;
  final String name;

  @override
  SliderContainerState createState() => SliderContainerState();
}

class SliderContainerState extends ConsumerState<SliderContainer> {
  final _sounds = AudioPlayer();

  @override
  void initState() {
    super.initState();
    birdSound();
  }

  @override
  void dispose() {
    _sounds.dispose();
    super.dispose();
  }

  double _currentRangeValue = 0;
  bool pauseChannel = false;

  @override
  Widget build(BuildContext context) {
    if (ref.watch(playProvider) & !pauseChannel & (_currentRangeValue != 0)) {
      _sounds.play();
    }

    if (!ref.watch(playProvider) | (_currentRangeValue == 0) | pauseChannel) {
      _sounds.pause();
    }

    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
                onTap: () => setState(() {
                      pauseChannel = !pauseChannel;
                    }),
                child: SvgPicture.asset(
                  widget.icon,
                  width: 50,
                  height: 50,
                  color: (ref.watch(playProvider) &
                          !pauseChannel &
                          (_currentRangeValue != 0))
                      ? Colors.blue
                      : Colors.black,
                )),
            Column(
              children: [
                Slider(
                  label: widget.name,
                  value: _currentRangeValue,
                  onChanged: (nextValue) => setState(
                    () {
                      _currentRangeValue = nextValue;
                      _sounds.setVolume(_currentRangeValue);
                    },
                  ),
                  min: 0,
                  max: 1,
                ),
                Text(widget.name)
              ],
            ),
          ],
        ),
      ),
    );
  }

  birdSound() async {
    await _sounds.setAsset(widget.sound);
    await _sounds.setLoopMode(LoopMode.one);
    await _sounds.setVolume(_currentRangeValue);
  }
}
