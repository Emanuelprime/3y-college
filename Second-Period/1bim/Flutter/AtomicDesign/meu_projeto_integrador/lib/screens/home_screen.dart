import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/screens/todo_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importar shared_preferences

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkModeEnabled = false;
  String _userName = 'Convidado';
  final TextEditingController _nameController =
      TextEditingController(); // Add controller

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = prefs.getBool('isDarkModeEnabled') ?? false;
      _userName = prefs.getString('userName') ?? 'Convidado';
      _nameController.text = _userName; // Set initial value
    });
  }

  Future<void> _toggleDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkModeEnabled = value;
    });
    await prefs.setBool('isDarkModeEnabled', value);
    // Para aplicar o tema imediatamente, precisaríamos de um ThemeMode no MyApp
    // Isso será abordado em aulas mais avançadas de gerenciamento de estado global.
  }

  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = name;
    });
    await prefs.setString('userName', name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Nome de usuário salvo: $_userName')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, $_userName!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Exemplo Shared Preferences: Switch de Dark Mode
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Modo Escuro:'),
                Switch(
                  value: _isDarkModeEnabled,
                  onChanged: _toggleDarkMode,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Exemplo Shared Preferences: Salvar nome
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: _nameController, // Use controller
                decoration: InputDecoration(
                  labelText: 'Mudar seu nome',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      _saveUserName(_nameController.text); // Pass text
                    },
                  ),
                ),
                onSubmitted: _saveUserName, // Salva ao pressionar Enter
              ),
            ),
            const SizedBox(height: 30),

            // Botão para navegar para a lista de Todos (agora com cache)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TodoListScreen()),
                );
              },
              child: const Text('Ver Lista de Tarefas (API + Cache)'),
            ),
          ],
        ),
      ),
    );
  }
}
