import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final bool? isComplete;
  final Function(bool?) checkBoxCallback;
  final VoidCallback pressed;
  TodoTile(
      {required this.title,
      required this.checkBoxCallback,
      required this.isComplete,
      required this.pressed});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: isComplete,
        onChanged: checkBoxCallback,
        activeColor: Colors.lightBlueAccent,
      ),
      trailing: IconButton(
        onPressed: pressed,
        icon: Icon(Icons.delete),
        color: Colors.red,
      ),
    );
  }
}
