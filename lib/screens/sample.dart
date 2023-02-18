import 'package:flutter/widgets.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: DefaultTextStyle(
        style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text('Item ${index + 1}');
          },
        ),
      ),
    );
  }
}
