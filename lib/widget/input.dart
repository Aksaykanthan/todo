import 'package:flutter/material.dart';

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
