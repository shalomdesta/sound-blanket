import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

late final Timer _timer;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    _timer = Timer(const Duration(seconds: 3),
        () => Navigator.of(context).pushNamed('/home_page'));

    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'lib/assets/icons/blanket-sound-wave-symbolic.svg',
          width: 200,
          height: 200,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
