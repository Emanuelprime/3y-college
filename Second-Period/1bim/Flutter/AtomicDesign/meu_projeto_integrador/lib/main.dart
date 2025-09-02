import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/screens/home_screen.dart'; // Importar a tela principal
import 'package:meu_projeto_integrador/screens/detail_screen.dart'; // Importar a tela de detalhes
import 'package:meu_projeto_integrador/screens/item_list_screen.dart';
import 'package:meu_projeto_integrador/screens/todo_list_screen.dart';
import 'package:meu_projeto_integrador/database/database_helper.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter está inicializado para o DB
  await DatabaseHelper.instance.database; // Inicializa o banco de dados

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Integrador',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
