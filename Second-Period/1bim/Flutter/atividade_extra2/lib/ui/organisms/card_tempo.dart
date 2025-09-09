import 'package:flutter/material.dart';

import '../atoms/cidades.dart';
import '../atoms/tempo_desc.dart';
import '../molecules/icone_e_tempo.dart';

class WeatherCard extends StatelessWidget {
  final String cityName;
  final String weatherDescription;
  final String weatherIcon;
  final double temperature;
  const WeatherCard({
    super.key,
    required this.cityName,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CityNameText(cityName: cityName),
          const SizedBox(height: 10),
          IconTemperatureRow(icon: weatherIcon, temperature: temperature),
          const SizedBox(height: 10),
          WeatherDescription(description: weatherDescription),
        ],
      ),
    );
  }
}
