import 'package:flutter/material.dart';
import 'package:todos_app/providers/todo_provider.dart';
import '/widgets/todo_tile.dart';
import 'package:provider/provider.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todo, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = todo.all[index];
          return TodoTile(
              title: task.title,
              isComplete: task.isChecked,
              pressed: () => todo.removeTodo(task),
              checkBoxCallback: (value) {
                todo.updateTodo(task, value);
              });
        },
        itemCount: todo.all.length,
      );
    });
  }
}
