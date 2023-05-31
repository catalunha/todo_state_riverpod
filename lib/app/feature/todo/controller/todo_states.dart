import 'package:flutter/foundation.dart';

import '../../../core/models/todo_model.dart';

enum TodoListStateStatus { initial, loading, success, error }

class TodoListState {
  final TodoListStateStatus status;
  final String? error;
  final List<TodoModel> list;
  TodoListState({
    required this.status,
    this.error,
    required this.list,
  });
  TodoListState.initial()
      : status = TodoListStateStatus.initial,
        error = '',
        list = [];

  TodoListState copyWith({
    TodoListStateStatus? status,
    String? error,
    List<TodoModel>? list,
  }) {
    return TodoListState(
      status: status ?? this.status,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }

  @override
  String toString() =>
      'TodoListState(status: $status, error: $error, list: $list)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoListState &&
        other.status == status &&
        other.error == error &&
        listEquals(other.list, list);
  }

  @override
  int get hashCode => status.hashCode ^ error.hashCode ^ list.hashCode;
}
