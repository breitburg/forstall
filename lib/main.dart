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
      home: Springboard(),
    );
  }
}

class Springboard extends StatelessWidget {
  const Springboard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
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
              StatusBar.translucent(),
              Spacer(),
              Dock(),
            ],
          ),
        ],
      ),
    );
  }
}
