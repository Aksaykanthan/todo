class Todo {
  String? id;
  String? text;
  bool is_done;

  Todo({
    required this.id,
    required this.text,
    this.is_done = false,
  });

  static List<Todo> todoList() {
    return [

      Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          text: "Coding",
          ),

    ];
  }
}
