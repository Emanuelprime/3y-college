import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  const ButtonText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16),
    );
  }
}
