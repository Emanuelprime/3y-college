import 'package:flutter/material.dart';
import '../atoms/button_text.dart';
import '../atoms/button_style.dart';

class UpdateWeatherButton extends StatelessWidget {
  final VoidCallback onPressed;
  const UpdateWeatherButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final buttonStyle = MainButtonStyle();
    final buttonText = ButtonText('Atualizar Clima');
    
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle.getStyle(),
      child: buttonText,
    );
  }
}
