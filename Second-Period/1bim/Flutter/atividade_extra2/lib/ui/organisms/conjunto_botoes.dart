import 'package:flutter/material.dart';

import '../molecules/botao_cidade.dart';
import '../molecules/botao_update.dart';

class WeatherActions extends StatelessWidget {
  final VoidCallback onUpdateWeather;
  final VoidCallback onSearchCity;
  const WeatherActions({
    super.key,
    required this.onUpdateWeather,
    required this.onSearchCity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UpdateWeatherButton(onPressed: onUpdateWeather),
        const SizedBox(height: 10),
        SearchCityButton(onPressed: onSearchCity),
      ],
    );
  }
}
