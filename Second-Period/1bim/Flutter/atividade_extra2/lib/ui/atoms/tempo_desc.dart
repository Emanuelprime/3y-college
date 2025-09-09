import 'package:flutter/material.dart';

class WeatherDescription extends StatelessWidget {
  final String description;
  const WeatherDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 20, color: Colors.black54),
      textAlign: TextAlign.center,
    );
  }
}
