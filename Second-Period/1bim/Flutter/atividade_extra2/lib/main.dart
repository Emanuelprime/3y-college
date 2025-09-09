// Este é o código inicial, sem nenhuma organização.
// A sua tarefa é refatorar este arquivo.

import 'package:flutter/material.dart';

import 'ui/pages/tempo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _cityName = 'São Paulo';
  double _temperature = 25.0;
  String _weatherDescription = 'Ensolarado';
  String _weatherIcon = '☀️';
  bool _isLoading = false;

  void _fetchWeather() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (_cityName == 'São Paulo') {
          _cityName = 'Rio de Janeiro';
          _temperature = 28.5;
          _weatherDescription = 'Chuva leve';
          _weatherIcon = '🌧️';
        } else {
          _cityName = 'São Paulo';
          _temperature = 25.0;
          _weatherDescription = 'Ensolarado';
          _weatherIcon = '☀️';
        }
        _isLoading = false;
      });
    });
  }

  void _searchCity() {
    // Implemente a lógica de busca de cidade aqui
    // Por enquanto, apenas um placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidade de busca não implementada!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(
        cityName: _cityName,
        temperature: _temperature,
        weatherDescription: _weatherDescription,
        weatherIcon: _weatherIcon,
        isLoading: _isLoading,
        onUpdateWeather: _fetchWeather,
        onSearchCity: _searchCity,
      ),
    );
  }
}
