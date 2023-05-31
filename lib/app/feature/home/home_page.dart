import 'package:flutter/material.dart';

import '../todo/todo_list_async.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo com State igual BLoC'),
      ),
      body: const TodoListAsync(),
    );
  }
}
