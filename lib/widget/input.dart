import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final addtask;
  InputBox({super.key, required this.addtask});

  final newtask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Center(
          child: TextField(
            controller: newtask,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => {addtask(newtask.text)},
                ),
                hintText: 'Task',
                fillColor: Colors.green,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
