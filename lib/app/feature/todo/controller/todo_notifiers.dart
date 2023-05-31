import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_riverpod/app/data/repositories/repositories_providers.dart';
import 'package:todo_state_riverpod/app/data/repositories/todo_repository.dart';
import 'package:todo_state_riverpod/app/feature/todo/controller/todo_states.dart';

class TodoListAsyNotNotifier extends AsyncNotifier<TodoListState> {
  // final TodoRepository _todoRepository;

  // TodoListAsyNotNotifier({required TodoRepository todoRepository})
  //     : _todoRepository = todoRepository;
  @override
  FutureOr<TodoListState> build() async {
    AsyncValue.guard(() async => TodoListState.initial());
    return await getAll();
    // return state.value!;
  }

  Future<TodoListState> getAll() async {
    try {
      print('getAll async 1:');
      state = const AsyncValue.loading();
      // state = state.copyWith(status: TodoListStateStatus.loading);
      print('getAll async 2:');
      print('getAll async 3:');
//       state =
//           state.copyWith(status: TodoListStateStatus.success, list: [...list]);
      // return state.value!
      //     .copyWith(status: TodoListStateStatus.success, list: [...list]);
      AsyncValue.guard(() async {
        final list = await ref.read(todoRepository).getAll();
        return state.value!
            .copyWith(status: TodoListStateStatus.success, list: [...list]);
      });
      return state.value!;
    } catch (e, s) {
      log('Error...', name: 'Erro em TodoListStNot.getAll');
      log('$e', name: 'Erro em TodoListStNot.getAll');
      log('$s', name: 'Erro em TodoListStNot.getAll');
      // return state.value!.copyWith(
      //     status: TodoListStateStatus.error,
      //     error: 'Erro em TodoListStNot.getAll');
      return state.value!;
    }
  }
}

class TodoListStNot extends StateNotifier<TodoListState> {
  final TodoRepository _todoRepository;
  TodoListStNot({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(TodoListState.initial()) {
    getAll();
  }

  FutureOr<void> getAll() async {
    try {
      print('getAll 1:');
      state = state.copyWith(status: TodoListStateStatus.loading);
      print('getAll 2:');
      final list = await _todoRepository.getAll();
      print('getAll 3:');
      state =
          state.copyWith(status: TodoListStateStatus.success, list: [...list]);
    } catch (e, s) {
      log('Error...', name: 'Erro em TodoListStNot.getAll');
      log('$e', name: 'Erro em TodoListStNot.getAll');
      log('$s', name: 'Erro em TodoListStNot.getAll');
      state = state.copyWith(
          status: TodoListStateStatus.error,
          error: 'Erro em TodoListStNot.getAll');
    }
  }
}

class TodoListNot extends Notifier<TodoListState> {
  final TodoRepository _todoRepository;
  TodoListNot({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super();

  FutureOr<void> getAll() async {
    try {
      print('getAll 1:');
      state = state.copyWith(status: TodoListStateStatus.loading);
      print('getAll 2:');
      final list = await _todoRepository.getAll();
      print('getAll 3:');
      state =
          state.copyWith(status: TodoListStateStatus.success, list: [...list]);
    } catch (e, s) {
      log('Error...', name: 'Erro em TodoListStNot.getAll');
      log('$e', name: 'Erro em TodoListStNot.getAll');
      log('$s', name: 'Erro em TodoListStNot.getAll');
      state = state.copyWith(
          status: TodoListStateStatus.error,
          error: 'Erro em TodoListStNot.getAll');
    }
  }

  @override
  TodoListState build() {
    return TodoListState.initial();
  }
}
