import 'package:flutter/widgets.dart';

class BatteryIndicator extends StatelessWidget {
  final double percentage;
  final bool showPercentage, charging;

  const BatteryIndicator(this.percentage,
      {super.key, this.showPercentage = false, this.charging = false});

  @override
  Widget build(BuildContext context) {
    final fillColor =
        percentage <= 0.2 && !charging ? const Color.fromRGBO(255, 0, 0, 1) : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showPercentage) ...[
          Text('${(percentage * 100).round()}%', textAlign: TextAlign.end),
          const SizedBox(width: 3),
        ],
        CustomPaint(
          size: const Size(22, 10),
          painter: BatteryPainter(
            percentage: percentage,
            fillColor: fillColor,
            bolt: charging,
          ),
        ),
      ],
    );
  }
}

class BatteryPainter extends CustomPainter {
  final double percentage, fillPadding;
  final Color borderColor, fillColor;
  final Size pimpSize;
  final bool bolt;

  const BatteryPainter({
    this.borderColor = const Color.fromRGBO(255, 255, 255, 1),
    Color? fillColor,
    this.percentage = 1,
    this.pimpSize = const Size(2, 4),
    this.fillPadding = 2,
    this.bolt = false,
  })  : fillColor = fillColor ?? borderColor,
        assert(0 <= percentage && percentage <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final fillPaint = Paint()..color = fillColor;

    final borderRect =
        Rect.fromLTRB(0, 0, size.width - pimpSize.width, size.height);

    // Draw the battery border
    canvas.drawRRect(
      RRect.fromRectAndRadius(borderRect, const Radius.circular(1)),
      borderPaint,
    );

    // Draw the battery pimp
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          borderRect.right,
          size.height / 2 - pimpSize.height / 2,
          pimpSize.width,
          pimpSize.height,
        ),
        const Radius.circular(1),
      ),
      borderPaint,
    );

    // Draw the battery fill
    if (percentage > 0) {
      canvas.drawRect(
        Rect.fromLTRB(
          borderRect.left + fillPadding,
          borderRect.top + fillPadding,
          borderRect.left +
              fillPadding +
              (borderRect.right - fillPadding * 2) * percentage,
          borderRect.bottom - fillPadding,
        ),
        fillPaint,
      );
    }

    // Draw the lightning bolt when charging
    if (bolt) {
      final boltSize = Size(10, size.height + 3);
      final boltOffset = Offset(borderRect.width / 2 - boltSize.width / 2, 0);
      final boltPath = Path()
        ..moveTo(boltOffset.dx + boltSize.width / 2 + boltSize.width * 0.2,
            (size.height - boltSize.height) / 2)
        ..lineTo(boltOffset.dx, size.height / 2)
        ..lineTo(boltOffset.dx + boltSize.width, size.height / 2)
        ..lineTo(boltOffset.dx + boltSize.width / 2 - boltSize.width * 0.2,
            (size.height - boltSize.height) / 2 + boltSize.height)
        ..close();

      canvas.drawPath(boltPath, borderPaint..style = PaintingStyle.fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
