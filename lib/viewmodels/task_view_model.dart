import 'package:flutter/material.dart';
import '../data/models/task_model.dart';
import '../data/repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await _repository.getAllTasks();
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    await _repository.insertTask(
      Task(title: title, description: description),
    );
    await loadTasks();
  }
}
