import 'package:todo_state_riverpod/app/core/models/todo_model.dart';
import 'package:todo_state_riverpod/app/data/datasources/todo_datasource.dart';

class TodoRepository {
  final TodoDataSource todoDataSource;
  TodoRepository({
    required this.todoDataSource,
  });

  Future<List<TodoModel>> getAll() {
    return todoDataSource.getAll();
  }
}
