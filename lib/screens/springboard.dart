import 'package:flutter/widgets.dart';
import 'package:forstall/core/page_route.dart';
import 'package:forstall/screens/sample.dart';
import 'package:forstall/widgets/app_icon.dart';
import 'package:forstall/widgets/dock/dock.dart';

class Springboard extends StatelessWidget {
  const Springboard({super.key});

  @override
  Widget build(BuildContext context) {
    final effectivePadding = MediaQuery.of(context).padding;

    return Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset('assets/bubbles.jpeg').image,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var row = 0; row < 5; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var app = 0; app < 4; app++)
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                ForstallPageRoute(
                                  builder: (BuildContext context) {
                                    return const SampleScreen();
                                  },
                                ),
                              ),
                              child: SpringboardAppIcon(
                                title: Text(
                                  'App ${index * 4 * 5 + (row * 4) + app}',
                                ),
                              ),
                            ),
                        ],
                      ),
                  ],
                );
              },
            ),
          ),
          const Dock(),
        ].reversed.toList(),
      ),
    );
  }
}
