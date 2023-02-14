export 'battery_indicator.dart';
export 'signal_indicator.dart';

import 'package:flutter/cupertino.dart';
import 'package:forstall/status_bar/signal_indicator.dart';
import 'package:forstall/status_bar/battery_indicator.dart';

class StatusBar extends StatelessWidget {
  final battery = 0.8;

  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      constraints: const BoxConstraints.tightFor(height: 20),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: Color.fromRGBO(0, 0, 0, 0.2),
            blurRadius: 6,
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Helvetica',
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        child: Opacity(
          opacity: 0.75,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: const [
                    SignalIndicator(0.8, operator: 'AT&T'),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BatteryIndicator(
                      percentage: battery,
                      showPercentage: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
