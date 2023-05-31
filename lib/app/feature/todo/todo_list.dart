import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_riverpod/app/feature/todo/controller/todo_states.dart';

import 'controller/todo_providers.dart';
import 'todo_card.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('TodoList (Widget) build');
    final todoStateStNotProvIW = ref.watch(todoStateStNotProv);
    ref.listen<TodoListState>(
      todoStateStNotProv,
      (previous, state) async {
        print('listen status previous: ${previous?.status}');
        print('listen status state: ${state.status}');
        if (state.status == TodoListStateStatus.error) {
          print('...${state.error}');
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error ?? '...')));
        }
        if (state.status == TodoListStateStatus.success) {
          print('success...');

          // Navigator.of(context).pop();
        }
        if (state.status == TodoListStateStatus.loading) {
          print('loading...');
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      onError: (error, stackTrace) {
        log('Error...', name: 'Erro em TodoList ConsumerWidget.build');
        log('$error', name: 'Erro em TodoList ConsumerWidget.build');
        log('$stackTrace', name: 'Erro em TodoList ConsumerWidget.build');
      },
    );
    // final todoStateStNotProvIW = ref.watch(todoStateStNotProv);
    print('TodoList (Widget) build status: ${todoStateStNotProvIW.status}');
    return Column(
      children: [
        IconButton(
            onPressed: () async {
              await ref.read(todoStateStNotProv.notifier).getAll();
            },
            icon: const Icon(Icons.abc)),
        SingleChildScrollView(
          child: Column(
            children: [
              for (final todo in todoStateStNotProvIW.list)
                TodoCard(model: todo),
            ],
          ),
        ),
      ],
    );
  }
}
