import 'package:flutter/widgets.dart';

class SpringboardAppIcon extends StatelessWidget {
  final Widget title;

  const SpringboardAppIcon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 70),
      child: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppIcon(),
          const SizedBox(height: 3),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              height: 1.2,
              shadows: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.75),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.75),
                  blurRadius: 30,
                ),
              ],
            ),
            child: title,
          ),
        ].reversed.toList(),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  final bool glossy;

  const AppIcon({super.key, this.glossy = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: BoxConstraints.tight(const Size.square(57)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(190, 190, 190, 1),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: CustomPaint(
        painter: glossy ? const IconGlossPainter() : null,
      ),
    );
  }
}

class IconGlossPainter extends CustomPainter {
  final double padding;

  const IconGlossPainter({this.padding = 10});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTRB(
        -padding,
        -padding * 2,
        size.width + padding,
        (size.height + padding) / 2,
      ),
      Paint()..color = const Color.fromRGBO(255, 255, 255, 0.4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
