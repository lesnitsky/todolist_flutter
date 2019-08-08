import 'package:flutter/material.dart';

import 'package:todo_list/todo.dart';

class NewTodoDialog extends StatelessWidget {
  final controller = new TextEditingController();

  void _submitTodo(BuildContext context, String title) {
    final todo = new Todo(title: title);
    controller.clear();
    Navigator.of(context).pop(todo);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New todo'),
      content: TextField(
        controller: controller,
        autofocus: true,
        onSubmitted: (value) {
          _submitTodo(context, value);
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            _submitTodo(context, controller.value.text);
          },
        ),
      ],
    );
  }
}
