import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:forstall/widgets/dock/dock.dart';
import 'package:forstall/widgets/status_bar/status_bar.dart';

void main() {
  runApp(const ForstallApp());
}

class ForstallApp extends StatelessWidget {
  const ForstallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: Springboard(),
      ),
    );
  }
}

class Springboard extends StatelessWidget {
  const Springboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/bubbles.jpeg',
          fit: BoxFit.cover,
        ),
        Column(
          children: [
            const StatusBar.translucent(),
            Expanded(
              child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox();
                },
              ),
            ),
            const Dock(),
          ],
        ),
      ],
    );
  }
}
