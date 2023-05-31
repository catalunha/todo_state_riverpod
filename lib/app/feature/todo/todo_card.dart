import 'package:flutter/material.dart';
import 'package:todo_state_riverpod/app/core/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel model;
  const TodoCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text(model.description),
        Switch(
          value: model.isCompleted,
          onChanged: (value) {
            print(value);
          },
        )
      ]),
    );
  }
}
