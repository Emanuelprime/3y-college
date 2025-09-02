import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart'; // Arquivo gerado pelo build_runner

@JsonSerializable()
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  // Métodos de fábrica para deserialização (from JSON)
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  // Método para serialização (to JSON)
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
