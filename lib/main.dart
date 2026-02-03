import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/task_view_model.dart';
import 'ui/views/task_list_view.dart';
import 'ui/views/add_task_view.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskViewModel()..loadTasks(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const TaskListView(),
        '/add': (_) => const AddTaskView(),
      },
    );

  }
}
