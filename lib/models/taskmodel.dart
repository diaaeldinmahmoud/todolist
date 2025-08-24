class Task {
  final String id;
  final String title;
  bool completed;
  DateTime? completedAt;

  Task({required this.id, required this.title, this.completed = false});

  void toggleCompleted() {
    completed = true;
  }
}
