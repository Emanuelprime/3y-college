import 'package:flutter/material.dart';

class MainButtonStyle {
  ButtonStyle getStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.lightBlue,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textStyle: const TextStyle(fontSize: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.lightBlue),
      ),
    );
  }
}

final ButtonStyle mainButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.lightBlue,
  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  textStyle: const TextStyle(fontSize: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(color: Colors.lightBlue),
  ),
);
