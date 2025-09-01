import 'dart:async';
import 'package:atividade_01_controle_gastos_viagens/helpers/database_helper.dart';
import 'package:atividade_01_controle_gastos_viagens/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ExpensesCreationScreen extends StatefulWidget {
  const ExpensesCreationScreen({super.key});

  @override
  State<ExpensesCreationScreen> createState() => _ExpensesCreationScreenState();
}

class _ExpensesCreationScreenState extends State<ExpensesCreationScreen> {
  final _formKey = GlobalKey<FormState>();

  double selectedExpensesLimit = 0.0;
  String? selectedCurrency;
  TextEditingController currencyController = TextEditingController();
  TextEditingController totalExpenseValueController = TextEditingController();
  TextEditingController descriptionExpenseController = TextEditingController();
  TextEditingController titleExpenseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedExpensesLimit = prefs.getDouble('selectedExpensesLimit') ?? 0.0; // [revisto] Bagulho do demonio, mas funcionou
      selectedCurrency = prefs.getString('selectedCurrency');
      currencyController.text = selectedCurrency ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleExpenseController,
              decoration: InputDecoration(
                hint: Text("Ex: Despesa de Hotel"),
                label: Text("Título do Gasto"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o título da despesa';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: descriptionExpenseController,
              maxLines: 3,
              decoration: InputDecoration(
                hint: Text("Ex: Quartos alugados, banho quente, prato feito para duas pessoas."),
                label: Text("Detalhes do Gasto"),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira os detalhes do gasto';
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                IntrinsicWidth(
                  stepWidth: 25,
                  child: Column(
                    children: [
                      TextFormField(
                        readOnly: true,
                        autofocus: false,
                        canRequestFocus: false,
                        controller: currencyController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      hint: Text("100.25"),
                      label: Text("Total do Gasto"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um valor correto';
                      }
                      return null;
                    },
                    controller: totalExpenseValueController,
                    onFieldSubmitted: (value) {
                      totalExpenseValueController.clear();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // [revisto] Instancia singleton
                  final dbHelper = DatabaseHelper();
                  
                  // [revisto] Usando um helper para gerar um objeto despesa
                  final newExpense = Expense(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: titleExpenseController.text,
                    description: descriptionExpenseController.text,
                    value: double.tryParse(totalExpenseValueController.text) ?? 0.0,
                  );

                  // [revisto] Inserindo o dado no databaseConn com o helper
                  await dbHelper.insertExpense(newExpense);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Despesa criada com sucesso!'), backgroundColor: Colors.green,),
                  );

                  // [revisto] Printando
                  final allExpenses = await dbHelper.getExpenses();
                  print(allExpenses);

                  // [revisto] Cleaning dummass
                  titleExpenseController.clear();
                  descriptionExpenseController.clear();
                  totalExpenseValueController.clear();
                }
              },
            child: const Text("Enviar"))
          ],
        ),
      ),
    );
  }
}

// [revisto] Unused shit
class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

// [revisto] Unused shit
class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 1000,
      divisions: 1001,
      label: _currentSliderValue.toStringAsFixed(2),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
