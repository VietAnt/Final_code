// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:todo_rest_api/services/todo_service.dart';
import 'package:todo_rest_api/utils/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;

  const AddTodoPage({super.key, this.todo});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  //--EditController--//
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  //---Tao State---//
  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Todo' : 'Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              isEdit ? updateData() : submitData();
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                isEdit ? 'Update' : 'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateData() async {
    //Get the data from
    final todo = widget.todo;
    if (todo == null) {
      print('You can not call update without todo data');
      return;
    }
    final id = todo['_id'];

    //Submit update data to the server:
    final isSuccess = await TodoService.updateTodo(id, body);
    //Show sucess or fail message based on status
    if (isSuccess) {
      showSucessMessage(context, message: 'Updation Sucesss');
    } else {
      showErrorMessage(context, message: 'Updation Failed');
    }
  }

  //---Form-----//
  Future<void> submitData() async {
    //Submit data to the server:
    final isSuccess = await TodoService.addTodo(body);

    //Show sucess or fail message based on status
    if (isSuccess) {
      titleController.text = '';
      descriptionController.text = '';
      showSucessMessage(context, message: 'Creation Sucesss');
    } else {
      showErrorMessage(context, message: 'Creatiom Failed');
    }
  }

  Map get body {
    //Get the data from from
    final title = titleController.text;
    final description = descriptionController.text;
    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }

  // void showSucessMessage(String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void showErrorMessage(String message) {
  //   final snackBar = SnackBar(
  //     content: Text(
  //       message,
  //       style: const TextStyle(color: Colors.white),
  //     ),
  //     backgroundColor: Colors.red,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
