import 'package:flutter/material.dart';

import '../organisms/weather_actions.dart';
import '../organisms/weather_card.dart';

class WeatherPage extends StatefulWidget {
  final String cityName;
  final double temperature;
  final String weatherDescription;
  final String weatherIcon;
  final bool isLoading;
  final VoidCallback onUpdateWeather;
  final VoidCallback onSearchCity;
  const WeatherPage({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.isLoading,
    required this.onUpdateWeather,
    required this.onSearchCity,
  });

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _showCard = true;
  Alignment _searchButtonAlignment = Alignment.center;

  @override
  void didUpdateWidget(covariant WeatherPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Quando muda cidade, anima o card
    if (oldWidget.cityName != widget.cityName) {
      setState(() {
        _showCard = false;
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          _showCard = true;
        });
      });
    }
  }

  void _animateSearchButton() {
    setState(() {
      _searchButtonAlignment = _searchButtonAlignment == Alignment.center
          ? Alignment.bottomRight
          : Alignment.center;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App do Clima'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: widget.isLoading
            ? AnimatedOpacity(
                opacity: widget.isLoading ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: const CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  AnimatedOpacity(
                    opacity: _showCard ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: widget.temperature > 27
                            ? Colors.orange[100]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(
                          _showCard ? 15 : 40,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: WeatherCard(
                        cityName: widget.cityName,
                        weatherDescription: widget.weatherDescription,
                        weatherIcon: widget.weatherIcon,
                        temperature: widget.temperature,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  AnimatedAlign(
                    alignment: _searchButtonAlignment,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    child: WeatherActions(
                      onUpdateWeather: widget.onUpdateWeather,
                      onSearchCity: () {
                        widget.onSearchCity();
                        _animateSearchButton();
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
