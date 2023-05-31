import 'package:todo_state_riverpod/app/core/models/todo_model.dart';

class TodoDataSource {
  Future<List<TodoModel>> getAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return await Future.value([
      TodoModel(description: 'a', isCompleted: true),
      TodoModel(description: 'b', isCompleted: false),
    ]);
  }
}
