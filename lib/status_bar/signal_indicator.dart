import 'package:flutter/cupertino.dart';

class SignalIndicator extends StatelessWidget {
  final String? operator;
  final double stregth;

  const SignalIndicator(
    this.stregth, {
    super.key,
    this.operator,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          size: const Size(20, 9),
          painter: SignalPainter(stregth: stregth),
        ),
        if (operator != null) ...[
          const SizedBox(width: 3),
          Text(operator!),
        ],
      ],
    );
  }
}

class SignalPainter extends CustomPainter {
  final double barCount, stregth, barSpacing;

  const SignalPainter({
    required this.stregth,
    this.barCount = 5,
    this.barSpacing = 1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color.fromRGBO(255, 255, 255, 1);

    final barWidth = size.width / barCount - barSpacing;
    final activeBars = (barCount * stregth).round();

    for (var bar = 0; bar < barCount; bar++) {
      final height =
          bar < activeBars ? size.height * (bar + 1) / barCount : 1.0;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            bar * (barWidth + barSpacing),
            size.height - height,
            barWidth,
            height,
          ),
          const Radius.circular(0.5),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
