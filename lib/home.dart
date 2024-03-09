import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final todolist = Todo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          'ToDo App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          InputBox(addtask: _addtask),
          for (Todo todo in todolist.reversed)
            Task(
              todo: todo,
              toggleDone: _toggleDone,
              deleteTask: _deleteTask,
            ),
        ],
      ),
    );
  }

  void _toggleDone(Todo todo) {
    setState(() {
      todo.is_done = !todo.is_done;
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _HomeState.todolist.removeWhere((element) => element.id == id);
    });
  }

  void _addtask(String newtask) {

    setState(() {
      
    todolist.add(Todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(), text: newtask));
    });

  }
}

class InputBox extends StatelessWidget {
  final addtask;
  InputBox({super.key, required this.addtask});

  final newtask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: TextField(
          controller: newtask,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => {addtask(newtask.text)},
              ),
              hintText: 'Task',
              fillColor: Colors.green,
              border: InputBorder.none),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final todo;
  final toggleDone;
  final deleteTask;

  const Task(
      {super.key,
      required this.todo,
      required this.toggleDone,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          toggleDone(todo!);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          color: todo!.is_done ? Colors.grey[400] : Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              todo!.text!,
              style: TextStyle(
                decoration: todo!.is_done ? TextDecoration.lineThrough : null,
                fontSize: 18,
              ),
            ),
            IconButton(
                onPressed: () {
                  deleteTask(todo!.id!);
                },
                icon: Icon(Icons.delete))
          ]),
        ),
      ),
    );
  }
}
