import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  final double size;
  const WeatherIcon({super.key, required this.icon, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Text(icon, style: TextStyle(fontSize: size));
  }
}
