import 'package:dru_care_task/todo/todo_bloc.dart';
import 'package:dru_care_task/todo/todo_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                    ),
                    controller: _controller,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color of the circle
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2), // Border color and width
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Colors.white), // Icon color inside the circle
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        context.read<TodoBloc>().add(AddTodo(_controller.text));
                        _controller.clear();
                      }
                    },
                    iconSize: 30,
                    splashRadius: 30,
                  ),
                )


              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (_) {
                          context.read<TodoBloc>().add(ToggleTodo(index));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}