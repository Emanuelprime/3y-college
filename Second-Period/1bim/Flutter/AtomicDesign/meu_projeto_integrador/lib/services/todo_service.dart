import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meu_projeto_integrador/models/todo_model.dart';
import 'package:meu_projeto_integrador/database/database_helper.dart'; // Importar o helper do DB

class TodoService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<List<Todo>> fetchTodos({bool forceApi = false}) async {
    if (!forceApi) {
      // Tenta buscar do cache primeiro
      final List<Map<String, dynamic>> localTodosJson = await _dbHelper.getTodos();
      if (localTodosJson.isNotEmpty) {
        print('Carregando todos do cache local...');
        return localTodosJson.map((json) => Todo.fromJson(json)).toList();
      }
    }

    // Se não houver cache ou forceApi for true, tenta da API
    print('Tentando carregar todos da API...');
    try {
      final response = await http.get(Uri.parse('$_baseUrl/todos'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<Todo> todos = jsonList.map((json) => Todo.fromJson(json)).toList();

        // Limpa o cache antigo e salva os novos dados da API
        await _dbHelper.deleteAllTodos();
        for (var todo in todos) {
          await _dbHelper.insertTodo(todo.toJson());
        }
        print('Todos carregados da API e salvos no cache.');
        return todos;
      } else {
        throw Exception('Falha ao carregar todos da API: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // Se a API falhar, e não havia cache, tenta carregar do DB local novamente
      final List<Map<String, dynamic>> localTodosJson = await _dbHelper.getTodos();
      if (localTodosJson.isNotEmpty) {
        print('Erro de conexão, carregando do cache local...');
        return localTodosJson.map((json) => Todo.fromJson(json)).toList();
      }
      throw Exception('Erro de conexão: ${e.message}. Verifique sua internet ou não há dados em cache.');
    } catch (e) {
      throw Exception('Erro inesperado ao buscar todos: $e');
    }
  }

  Future<Todo> createTodo(Todo todo) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/todos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(todo.toJson()),
      );

      if (response.statusCode == 201) {
        final createdTodo = Todo.fromJson(jsonDecode(response.body));
        // Opcional: salvar o todo recém-criado no DB local também
        await _dbHelper.insertTodo(createdTodo.toJson());
        return createdTodo;
      } else {
        throw Exception('Falha ao criar todo na API: ${response.statusCode}');
      }
    } catch (e) {
      // Se falhar a criar na API, podemos salvar localmente para sincronizar depois
      await _dbHelper.insertTodo(todo.toJson()); // Salva localmente
      throw Exception('Erro ao criar todo. Salvo localmente para sincronização futura: $e');
    }
  }
}
