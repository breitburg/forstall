import 'package:flutter/widgets.dart';

class SpringboardAppIcon extends StatelessWidget {
  final Widget title;
  final VoidCallback onTap;

  const SpringboardAppIcon(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(width: 75),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          verticalDirection: VerticalDirection.up,
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppIcon(),
            const SizedBox(height: 3),
            DefaultTextStyle(
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1),
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
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      ),
      child: CustomPaint(
        foregroundPainter: glossy ? const IconGlossPainter() : null,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(190, 190, 190, 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconGlossPainter extends CustomPainter {
  final double padding;
  final Color color;

  const IconGlossPainter({
    this.padding = 10,
    this.color = const Color.fromRGBO(255, 255, 255, 0.5),
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTRB(
        -padding,
        -padding * 2,
        size.width + padding,
        (size.height + padding) / 2,
      ),
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
