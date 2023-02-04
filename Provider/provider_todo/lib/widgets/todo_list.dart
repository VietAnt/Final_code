import 'package:flutter/material.dart';
import 'package:provider_todo/models/todo.dart';

Widget todoList(BuildContext context, List<Todo> todos, toggleTodo, loadMore) {
  ScrollController _scrollController = ScrollController();

  //*SCrollController
  _scrollController.addListener(
    () {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        loadMore();
      }
    },
  );

  return ListView.separated(
    controller: _scrollController,
    itemBuilder: (BuildContext context, int index) {
      final todo = todos[index];
      final statusIcon = todo.status == 'open'
          ? Icons.radio_button_unchecked
          : Icons.radio_button_checked;
      return ListTile(
        key: Key((todo.id).toString()),
        leading: Icon(statusIcon),
        enabled: todo.status != 'processing',
        onTap: () {
          toggleTodo(context, todo);
        },
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.black38,
    ),
    itemCount: todos.length,
  );
}
