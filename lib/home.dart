import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/widget/input.dart';
import 'package:todo/widget/task.dart';

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
        title: const Text(
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
