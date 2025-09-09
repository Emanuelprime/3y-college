import 'package:flutter/material.dart';
import '../atoms/button_text.dart';
import '../atoms/button_style.dart';

class SearchCityButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SearchCityButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = MainButtonStyle();
    final buttonText = ButtonText('Buscar Nova Cidade');
    
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle.getStyle(),
      child: buttonText,
    );
  }
}
