import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/todo_model.dart';
import 'package:meu_projeto_integrador/services/todo_service.dart';
import 'package:meu_projeto_integrador/shared/constants/app_colors.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late Future<List<Todo>> _todosFuture;
  final TodoService _todoService = TodoService();

  @override
  void initState() {
    super.initState();
    _todosFuture = _todoService.fetchTodos();
  }

  // Função para recarregar os dados
  Future<void> _refreshTodos() async {
    setState(() {
      _todosFuture = _todoService.fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas (API)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, semanticLabel: 'Recarregar Tarefas'),
            onPressed: _refreshTodos,
          ),
        ],
      ),
      body: FutureBuilder<List<Todo>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, color: AppColors.error, size: 60),
                    const SizedBox(height: 10),
                    Text(
                      'Erro ao carregar tarefas: ${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.error),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _refreshTodos,
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma tarefa encontrada.',
                style: TextStyle(fontSize: 18, color: AppColors.vazio),
              ),
            );
          } else {
            // Sucesso na requisição, exibe a lista
            final List<Todo> todos = snapshot.data!;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: todo.completed ? AppColors.success : AppColors.accent,
                      child: Icon(
                        todo.completed ? Icons.check : Icons.hourglass_empty,
                        color: AppColors.background,
                      ),
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text('ID: ${todo.id} | Usuário: ${todo.userId}'),
                    trailing: todo.completed
                        ? const Icon(Icons.done_all, color: AppColors.success)
                        : const Icon(Icons.pending_actions, color: AppColors.accent),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tarefa: ${todo.title} - Concluída: ${todo.completed}')),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Exemplo de como criar um novo todo
          final newTodo = Todo(userId: 1, id: 201, title: 'Nova Tarefa Adicionada', completed: false);
          try {
            final createdTodo = await _todoService.createTodo(newTodo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tarefa "${createdTodo.title}" criada com sucesso!')),
            );
            _refreshTodos(); // Recarrega a lista para mostrar o novo item (pode não aparecer se a API não persistir)
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro ao criar tarefa: $e')),
            );
          }
        },
        child: const Icon(Icons.add),
        tooltip: 'Adicionar Nova Tarefa',
      ),
    );
  }
}
