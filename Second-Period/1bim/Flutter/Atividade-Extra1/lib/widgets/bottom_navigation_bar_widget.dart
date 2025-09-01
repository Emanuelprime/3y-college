
import 'package:atividade_01_controle_gastos_viagens/screens/expenses_creation_screen.dart';
import 'package:atividade_01_controle_gastos_viagens/screens/expenses_screen.dart';
import 'package:atividade_01_controle_gastos_viagens/screens/user_config_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  static const List<String> _widgetAppTitles = <String>[
    'Dashboard',
    'Adicionar Gastos',
    'Configurações',
  ];
  
  static const List<Widget> _widgetOptions = <Widget>[
    ExpensesScreen(),
    ExpensesCreationScreen(),
    UserConfigScreen(),
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetAppTitles.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: _widgetAppTitles.elementAt(0)),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: _widgetAppTitles.elementAt(1)),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: _widgetAppTitles.elementAt(2)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[400],
        onTap: _onItemTapped,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}