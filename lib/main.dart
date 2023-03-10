import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:forstall/core/page_route.dart';
import 'package:forstall/screens/springboard.dart';
import 'package:forstall/widgets/status_bar/status_bar.dart';

void main() {
  runApp(
    Center(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        constraints: const BoxConstraints.tightFor(width: 320, height: 568),
        child: const ForstallApp(),
      ),
    ),
  );
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

        const statusBar = StatusBar.translucent();

        return Stack(
          children: [
            MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: EdgeInsets.only(
                  top: statusBar.preferredSize.height,
                ), // Status Bar Height
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
