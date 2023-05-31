import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_riverpod/app/data/datasources/todo_datasource.dart';

final todoDataSource = Provider((ref) => TodoDataSource());
