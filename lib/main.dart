import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:forstall/core/page_route.dart';
import 'package:forstall/screens/sample.dart';
import 'package:forstall/widgets/app_icon.dart';
import 'package:forstall/widgets/dock/dock.dart';
import 'package:forstall/widgets/status_bar/status_bar.dart';

void main() {
  runApp(const ForstallApp());
}

class ForstallApp extends StatelessWidget {
  const ForstallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
        return ForstallPageRoute<T>(settings: settings, builder: builder);
      },
      builder: (BuildContext context, Widget? child) {
        if (child == null) {
          return const SizedBox.shrink();
        }

        final effectiveMediaQueryData = MediaQuery.of(context);
        const statusBar = StatusBar.translucent();

        return Stack(
          children: [
            MediaQuery(
              data: effectiveMediaQueryData.copyWith(
                padding: effectiveMediaQueryData.padding +
                    EdgeInsets.only(
                        top: statusBar
                            .preferredSize.height), // Status Bar Height
              ),
              child: child,
            ),
            statusBar,
          ],
        );
      },
      debugShowCheckedModeBanner: false,
      color: const Color.fromRGBO(0, 0, 0, 1),
      home: const Springboard(),
    );
  }
}

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
