import 'package:flutter/material.dart';

class TemperatureText extends StatelessWidget {
  final double temperature;
  final double size;
  const TemperatureText({super.key, required this.temperature, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${temperature.toStringAsFixed(1)}°C',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w200,
        color: Colors.black87,
      ),
    );
  }
}
