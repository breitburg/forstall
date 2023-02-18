export 'battery_indicator.dart';
export 'signal_indicator.dart';

import 'package:flutter/widgets.dart';
import 'package:forstall/widgets/status_bar/signal_indicator.dart';
import 'package:forstall/widgets/status_bar/battery_indicator.dart';

class StatusBar extends StatelessWidget with PreferredSizeWidget {
  final Color backgroundColor;
  final Border? border;
  final bool hasShadow;

  const StatusBar.translucent({
    super.key,
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.5),
    this.border = const Border(
      bottom: BorderSide(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        width: 1,
      ),
    ),
    this.hasShadow = true,
  });

  const StatusBar.blue({
    super.key,
    this.backgroundColor = const Color.fromRGBO(75, 102, 134, 1),
    this.border,
    this.hasShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      constraints: BoxConstraints.tight(preferredSize),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        boxShadow: [
          if (hasShadow)
            const BoxShadow(
              offset: Offset(0, 3),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 6,
            ),
        ],
      ),
      child: Opacity(
        opacity: 0.75,
        child: _buildIndicatorsRow(),
      ),
    );
  }

  Widget _buildIndicatorsRow() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(255, 255, 255, 1),
        height: 1.2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SignalIndicator(0.5, operator: 'AT&T'),
                SizedBox(width: 8),
                Text('LTE'),
              ],
            ),
          ),
          const Text(
            '9:41 AM',
            style: TextStyle(fontSize: 14, height: 1.1),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                BatteryIndicator(0.36, showPercentage: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(20);
}
