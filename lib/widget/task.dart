import 'package:flutter/material.dart';

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
