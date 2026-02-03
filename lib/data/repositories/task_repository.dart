import '../../core/database/app_database.dart';
import '../models/task_model.dart';

class TaskRepository {
  final AppDatabase _db = AppDatabase.instance;

  Future<List<Task>> getAllTasks() async {
    final database = await _db.database;
    final result = await database.query('tasks');
    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> insertTask(Task task) async {
    final database = await _db.database;
    await database.insert('tasks', task.toMap());
  }
}
