import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserConfigScreen extends StatelessWidget {
  const UserConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DropdownMenuWidget(),
    );
  }
}

class DropdownMenuWidget extends StatefulWidget {
  const DropdownMenuWidget({super.key});

  @override
  State<DropdownMenuWidget> createState() => _DropdownMenuWidgetState();
}

class _DropdownMenuWidgetState extends State<DropdownMenuWidget> {
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController expenseLimitController = TextEditingController();

  String? selectedCurrency = "JPY";
  double? selectedExpenseLimit = 100.0;

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    if (selectedCurrency != null) {
      await prefs.setString('selectedCurrency', selectedCurrency!);
    }
    if (selectedExpenseLimit != null) {
      await prefs.setDouble('selectedExpensesLimit', selectedExpenseLimit!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownMenu<String>(
                hintText: "Selecione uma Moeda",
                controller: currencyController,
                requestFocusOnTap: true,
                initialSelection: selectedCurrency,
                label: const Text("Moeda"),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "BRL", label: "BRL"),
                  DropdownMenuEntry(value: "USD", label: "USD"),
                  DropdownMenuEntry(value: "EUR", label: "EUR"),
                  DropdownMenuEntry(value: "GBP", label: "GBP"),
                  DropdownMenuEntry(value: "JPY", label: "JPY"),
                ],
                onSelected: (String? moedaSelecionada) {
                  setState(() {
                    selectedCurrency = moedaSelecionada;
                  });
                },
              ),
              const SizedBox(height: 18),
              TextField(
                controller: expenseLimitController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.monetization_on),
                  suffixIcon: Icon(Icons.clear),
                  labelText: 'Limite de gastos',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: () async {
                  setState(() {
                    selectedExpenseLimit = double.tryParse(expenseLimitController.text) ?? 0.0;
                  });
          
                  await _saveSettings();
                  if (mounted) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Aviso'),
                          content: Text(
                              'Suas configurações foram salvas!\nMoeda Selecionada: $selectedCurrency\nLimite de Gastos: $selectedExpenseLimit'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                label: const Text(
                  "Salvar",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
