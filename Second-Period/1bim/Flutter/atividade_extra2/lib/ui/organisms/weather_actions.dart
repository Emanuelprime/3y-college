import 'package:flutter/material.dart';

import '../molecules/search_city_button.dart';
import '../molecules/update_weather_button.dart';

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
