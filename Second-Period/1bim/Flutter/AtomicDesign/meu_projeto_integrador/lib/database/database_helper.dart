import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'app_database.db');

    return await openDatabase(
      path,
      version: 1, // Mude a versão para disparar onUpgrade
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // Adicione o onUpgrade para migrações
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Criar a tabela 'todos'
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        title TEXT,
        completed INTEGER
      )
    ''');
    // Adicionar outras tabelas se necessário
  }

  // Exemplo de migração para futuras versões do DB
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Exemplo: se a versão mudar de 1 para 2, adicione uma nova coluna
    if (oldVersion < 2) {
      // await db.execute("ALTER TABLE todos ADD COLUMN new_column TEXT;");
    }
    // ... lidar com outras migrações
  }

  // Métodos CRUD para 'todos'
  Future<int> insertTodo(Map<String, dynamic> todo) async {
    return await _database!.insert('todos', todo, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    return await _database!.query('todos');
  }

  Future<int> updateTodo(Map<String, dynamic> todo) async {
    return await _database!.update(
      'todos',
      todo,
      where: 'id = ?',
      whereArgs: [todo['id']],
    );
  }

  Future<int> deleteTodo(int id) async {
    return await _database!.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAllTodos() async {
    return await _database!.delete('todos');
  }
}
