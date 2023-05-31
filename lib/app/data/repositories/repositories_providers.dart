import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_riverpod/app/data/repositories/todo_repository.dart';

import '../datasources/datasources_providers.dart';

final todoRepository = Provider(
  (ref) => TodoRepository(
    todoDataSource: ref.read(todoDataSource),
  ),
);
