import 'package:flutter/material.dart';

class UpdateWeatherButton extends StatelessWidget {
  final VoidCallback onPressed;
  const UpdateWeatherButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Atualizar Clima'),
    );
  }
}
