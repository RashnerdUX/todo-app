import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/main.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.ToDo,
      required this.isChecked,
      required this.checkBoxCallback,
      required this.deleteCallback});

  late String ToDo;
  bool isChecked;
  void Function(bool?) checkBoxCallback;
  void Function() deleteCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteCallback,
      child: CheckboxListTile(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
        title: Text(
          ToDo,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
