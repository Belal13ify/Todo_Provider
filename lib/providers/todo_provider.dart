import 'package:flutter/material.dart';
import 'package:todos_app/models/task.dart';

class TodoProvider with ChangeNotifier {
  bool? isComplete = false;
  List<Task> completed = [];
  List<Task> incompleted = [];
  List<Task> all = [
    // Task(title: "Go to School"),
    // Task(title: "Help your Family"),
    // Task(title: "Get Some Sleep")
  ];

  void checkBoxState(bool? value) {
    isComplete = value;
    notifyListeners();
  }

  void updateTodo(Task task, bool? complete) {
    task.toggleChecked();
    if (complete == true) {
      completed.add(task);
      incompleted.remove(task);
    } else {
      completed.remove(task);
      incompleted.add(task);
    }
    notifyListeners();
  }

  void addTodo(String todoTitle, bool? checked) {
    final task = Task(title: todoTitle, isChecked: checked);
    if (checked == true) {
      all.add(task);
      completed.add(task);
      // task.checked;
    } else {
      all.add(task);
      incompleted.add(task);
      // task.checked;
    }
    notifyListeners();
  }

  void removeTodo(Task task) {
    all.remove(task);
    completed.remove(task);
    incompleted.remove(task);
    notifyListeners();
  }
}
