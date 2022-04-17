import 'package:flutter/material.dart';
import 'package:sound/widgets/theme_select.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 3,
          horizontal: MediaQuery.of(context).size.width / 6),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Theme  "), ThemeSelect()],
            )
          ],
        ),
      ),
    );
  }
}
