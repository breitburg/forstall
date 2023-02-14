import 'package:flutter/cupertino.dart';

class BatteryIndicator extends StatelessWidget {
  final double percentage;
  final bool showPercentage, isCharging;

  const BatteryIndicator({
    super.key,
    required this.percentage,
    this.showPercentage = false,
    this.isCharging = false,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = isCharging
        ? CupertinoColors.activeGreen
        : (percentage <= 0.2 ? CupertinoColors.systemRed : null);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showPercentage) ...[
          Text('${(percentage * 100).round()}%'),
          const SizedBox(width: 3),
        ],
        CustomPaint(
          size: const Size(22, 10),
          painter: BatteryPainter(percentage: percentage, fillColor: fillColor),
        ),
      ],
    );
  }
}

class BatteryPainter extends CustomPainter {
  final double percentage, fillPadding;
  final Color borderColor, fillColor;
  final Size pimpSize;

  const BatteryPainter({
    this.borderColor = const Color.fromRGBO(255, 255, 255, 1),
    Color? fillColor,
    this.percentage = 1,
    this.pimpSize = const Size(2, 4),
    this.fillPadding = 2,
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
    if (percentage <= 0) return;
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
