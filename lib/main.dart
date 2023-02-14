import 'package:flutter/cupertino.dart';
import 'package:forstall/status_bar/status_bar.dart';

void main() {
  runApp(const ForstallApp());
}

class ForstallApp extends StatelessWidget {
  const ForstallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Springboard(),
    );
  }
}

class Springboard extends StatelessWidget {
  const Springboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/bubbles.jpeg',
            fit: BoxFit.cover,
          ),
          Column(
            children: const [
              StatusBar(),
            ],
          ),
        ],
      ),
    );
  }
}
