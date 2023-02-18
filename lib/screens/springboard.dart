import 'package:flutter/widgets.dart';
import 'package:forstall/core/page_route.dart';
import 'package:forstall/screens/sample.dart';
import 'package:forstall/widgets/app_icon.dart';
import 'package:forstall/widgets/dock/dock.dart';
import 'package:forstall/widgets/page_dots.dart';

class Springboard extends StatefulWidget {
  const Springboard({super.key});

  @override
  State<Springboard> createState() => _SpringboardState();
}

class _SpringboardState extends State<Springboard> {
  final PageController controller = PageController();
  final int length = 6;

  @override
  Widget build(BuildContext context) {
    final effectivePadding = MediaQuery.of(context).padding;

    return Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(210, 210, 210, 1),
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
              controller: controller,
              itemCount: length,
              itemBuilder: (BuildContext context, int index) {
                const rows = 5;
                const columns = 4;
                final offset = index * rows * columns;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var row = 0; row < rows; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var app = 0; app < columns; app++)
                            SpringboardAppIcon(
                              title: Text(
                                'App ${offset + row * columns + app + 1}',
                              ),
                              onTap: () => Navigator.of(context).push(
                                ForstallPageRoute(
                                  builder: (BuildContext context) {
                                    return const SampleScreen();
                                  },
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: PageDots(controller: controller, length: length),
          ),
          const Dock(),
        ].reversed.toList(),
      ),
    );
  }
}
