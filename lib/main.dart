import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tasks_screen.dart';
import 'package:todoey_flutter/models/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<taskData>(
      create: (context) => taskData(),
      child: MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}

class taskData extends ChangeNotifier {
  String taskItem = 'New Task';
  List<Task> allTasks = [];

  void createTask(String newTask) {
    taskItem = newTask;
    notifyListeners();
  }

  void createTaskList(String newTask) {
    allTasks.add(
      Task(name: newTask, isDone: false),
    );
    notifyListeners();
  }

  void updateTasks(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTasks(Task task) {
    allTasks.remove(task);
    notifyListeners();
  }
}
