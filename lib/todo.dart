
class Todo {
  String? id;
  String? text;
  bool isdone;

  Todo({
    required this.id,
    required this.text,
    this.isdone = false,
  });

  static List<Todo> todoList() {
    return [];
  }
}


