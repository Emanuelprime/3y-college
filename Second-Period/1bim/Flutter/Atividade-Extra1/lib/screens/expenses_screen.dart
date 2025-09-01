import 'package:atividade_01_controle_gastos_viagens/helpers/database_helper.dart';
import 'package:atividade_01_controle_gastos_viagens/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder<List<Expense>>(
        future: DatabaseHelper().getExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  Text("Carregando Despesas..."));
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum gasto encontrado! =["));
          }

          final gastosLista = snapshot.data!;

          return GridView.builder(
            itemCount: gastosLista.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.66,    // [revisto] Mudando isso temos o tamanho do card, mas ainda esta bem bugado
            ),
            itemBuilder: (context, index) {
              final gastoItem = gastosLista[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // [revisto] Imagem (testando ainda)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        'https:// [revisto] Placehold.co/200x200.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // [revisto] Nome
                    Text(
                      gastoItem.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // [revisto] Preço
                    Text(
                      gastoItem.value.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    // [revisto] Descrição
                    const SizedBox(height: 4),
                    Text(
                      gastoItem.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }
}
