import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/task_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  Color _getItemColor(int index) {
    final colors = [
      const Color(0xFFB3E5FC), 
      const Color(0xFFFFCDD2), 
      const Color(0xFFC8E6C9), 
      const Color(0xFFD1C4E9), 
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.blue, size: 28),
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F7FB),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: vm.tasks.length,
        itemBuilder: (context, index) {
          final task = vm.tasks[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getItemColor(index),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  task.description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
