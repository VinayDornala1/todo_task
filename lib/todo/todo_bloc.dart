import 'package:dru_care_task/todo/todo_event.dart';
import 'package:dru_care_task/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) {
      final updatedTodos = List<Todo_Model>.from(state.todos)..add(Todo_Model(title: event.title));
      emit(TodoState(updatedTodos));
    });

    on<ToggleTodo>((event, emit) {
      final updatedTodos = List<Todo_Model>.from(state.todos);
      updatedTodos[event.index].isCompleted = !updatedTodos[event.index].isCompleted;
      emit(TodoState(updatedTodos));
    });
  }
}