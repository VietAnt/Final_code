import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  //*Bien
  final Function addTodo;
  AddTodo({super.key, required this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  //*textController
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      // ignore: unnecessary_new
      child: new Wrap(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 2,
              maxLines: null,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(hintText: "New to do item"),
              controller: textController,
            ),
          ),
          // ignore: prefer_const_constructors
          ButtonBar(
            children: <Widget>[
              // ignore: unnecessary_new
              new TextButton(
                child: new Text('Save'),
                onPressed: () async {
                  await widget.addTodo(textController.text);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
