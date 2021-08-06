class Task {
  final String title;
  bool? isChecked;

  Task({required this.title, this.isChecked = false});

  void toggleChecked() {
    isChecked = !isChecked!;
  }

  get checked {
    return isChecked;
  }
}
