import 'package:dru_care_task/todo_model.dart';

abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String title;
  AddTodo(this.title);
}

class ToggleTodo extends TodoEvent {
  final int index;
  ToggleTodo(this.index);
}

// State
class TodoState {
  final List<Todo_Model> todos;
  TodoState(this.todos);
}