import 'package:flutter/material.dart';

import 'package:todo_list/todo.dart';

typedef ToggleTodoCallback = void Function(Todo, bool);
typedef RemoveTodoCallback = void Function(List<Todo>, int);

class TodoList extends StatelessWidget {
  TodoList({@required this.todos, this.onTodoToggle, this.onRemoveTodo});

  final List<Todo> todos;
  final ToggleTodoCallback onTodoToggle;
  final RemoveTodoCallback onRemoveTodo;

  TextStyle _getTextStyle(BuildContext context, bool isDone) {
    if (!isDone) return null;

    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  Widget _buildDismissibleBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return Dismissible(
      key: Key(UniqueKey().toString()),
      background: _buildDismissibleBackground(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onRemoveTodo(todos, index);
      },
      child: CheckboxListTile(
        value: todo.isDone,
        title: Text(
          todo.title,
          style: _getTextStyle(context, todo.isDone),
        ),
        onChanged: (bool isChecked) {
          onTodoToggle(todo, isChecked);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}
