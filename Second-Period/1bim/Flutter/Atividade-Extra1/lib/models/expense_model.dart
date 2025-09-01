class Expense {
  final int id;
  final double value;
  final String title;
  final String description;

  const Expense({required this.id, required this.value, required this.title, required this.description});

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title, 'description': description, 'value': value};
  }

  @override
  String toString() {
    return 'Expense{id: $id, title: $title, description: $description, value: $value}';
  }
}