import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_riverpod/app/data/repositories/repositories_providers.dart';
import 'package:todo_state_riverpod/app/feature/todo/controller/todo_states.dart';

import 'todo_notifiers.dart';

final todoStateStNotProv =
    StateNotifierProvider<TodoListStNot, TodoListState>((ref) {
  print('todoListStNotProv...');
  return TodoListStNot(todoRepository: ref.read(todoRepository));
});
// final todoListProvider = Provider<List<TodoModel>>((ref) {
//   final state=ref.watch(todoStateStNotProv);
//   return state.;
// });

final todoListAsyNotProv =
    AsyncNotifierProvider<TodoListAsyNotNotifier, TodoListState>(() {
  print('todoListAsyNotProv...');
  return TodoListAsyNotNotifier();
});
