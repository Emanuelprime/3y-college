import 'package:flutter/material.dart';

import '../atoms/temperatura.dart';
import '../atoms/icone.dart';

class IconTemperatureRow extends StatelessWidget {
  final String icon;
  final double temperature;
  const IconTemperatureRow({
    super.key,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIcon(icon: icon),
        const SizedBox(width: 10),
        TemperatureText(temperature: temperature),
      ],
    );
  }
}
