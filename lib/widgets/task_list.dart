import 'package:flutter/material.dart';
import 'package:todoey_flutter/main.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<taskData>(
      builder: (BuildContext context, taskData value, Widget? child) {
        return ListView.builder(
            itemCount: value.allTasks.length,
            itemBuilder: (context, index) {
              return TodoItem(
                ToDo: value.allTasks[index].name,
                isChecked: value.allTasks[index].isDone,
                checkBoxCallback: (checkBoxState) {
                  value.updateTasks(value.allTasks[index]);
                },
                deleteCallback: () {
                  value.deleteTasks(value.allTasks[index]);
                },
              );
            });
      },
    );
  }
}
