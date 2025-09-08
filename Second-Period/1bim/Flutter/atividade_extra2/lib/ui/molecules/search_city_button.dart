import 'package:flutter/material.dart';

class SearchCityButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SearchCityButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightBlue,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.lightBlue),
        ),
      ),
      child: const Text('Buscar Nova Cidade'),
    );
  }
}
