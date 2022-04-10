import 'package:flutter/material.dart';
import 'package:sound/widgets/theme_select.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 300, horizontal: 400),
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [Text("Theme"), ThemeSelect()],
            )
          ],
        ),
      ),
    );
  }
}
