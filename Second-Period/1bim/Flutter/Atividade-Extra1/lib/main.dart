import 'package:atividade_01_controle_gastos_viagens/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BottomNavigationBarWidget(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

