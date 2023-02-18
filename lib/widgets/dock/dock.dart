import 'package:flutter/widgets.dart';

class Dock extends StatelessWidget {
  const Dock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.tightFor(height: 45),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -20),
            color: Color.fromRGBO(0, 0, 0, 1),
            blurRadius: 90,
          ),
        ],
      ),
      child: CustomPaint(
        painter: DockPainter(),
        child: Container(),
      ),
    );
  }
}

class DockPainter extends CustomPainter {
  final perspective = 20.0;
  final chin = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final shelfPaint = Paint()
      ..color = const Color.fromRGBO(0, 0, 0, 0.3)
      ..style = PaintingStyle.fill;

    final chinPaint = Paint()
      ..color = const Color.fromRGBO(0, 0, 0, 0.1)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTRB(0, size.height - chin, size.width, size.height),
      chinPaint,
    );

    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - chin)
        ..lineTo(perspective, 0)
        ..lineTo(size.width - perspective, 0)
        ..lineTo(size.width, size.height - chin)
        ..close(),
      shelfPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
