import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Dados que serão recebidos da tela anterior
  final int itemId;
  final String itemName;
  final int cliquesContador;

  const DetailScreen({
    super.key,
    required this.itemId,
    required this.itemName,
    this.cliquesContador = 0, // Valor padrão caso não seja passado
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes: $itemName'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você está na Tela de Detalhes!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'ID do Item: $itemId',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Nome do Item: $itemName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Cliques na tela anterior: $cliquesContador',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela anterior
              },
              child: const Text('Voltar para Tela Principal'),
            ),
          ],
        ),
      ),
    );
  }
}
