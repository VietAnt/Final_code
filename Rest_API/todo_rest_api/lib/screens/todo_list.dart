import 'package:flutter/material.dart';
import 'package:todo_rest_api/screens/add_page.dart';
import 'package:todo_rest_api/services/todo_service.dart';
import 'package:todo_rest_api/utils/snackbar_helper.dart';
import 'package:todo_rest_api/widget/todo_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true; //load
  //items
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: const CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: () => fetchTodo(),
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                'No Todo Item',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                //-----------------------------//
                final item = items[index] as Map;
                final id = item['_id'] as String;
                return TodoCard(
                  index: index,
                  item: item,
                  navigateEdit: navigateToEditPage,
                  deleteById: deleteById,
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => navigateToAddPage(),
        label: const Text('Add Todo'),
      ),
    );
  }

  //navigateTodAddPage()
  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

//navigateTodAddPage()
  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  //deleteById(id): Xoa Todo
  Future<void> deleteById(String id) async {
    //Delete the item
    final isSuccess = await TodoService.deleteById(id);
    if (isSuccess) {
      //Remove item from the lists
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showErrorMessage(context, message: 'Delete Failed');
    }
  }

  //GET Todo : Lay Todo
  Future<void> fetchTodo() async {
    // const url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
    // final uri = Uri.parse(url);
    // final response = await http.get(uri)

    final response = await TodoService.fetchTodos();
    if (response != null) {
      setState(() {
        items = response;
      });
    } else {
      showErrorMessage(context, message: 'Something went wrong');
    }
    setState(() {
      isLoading = false;
    });
  }

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



      // Widget TodoCard(){
      //          return Card(
      //             child: ListTile(
      //               leading: CircleAvatar(
      //                 child: Text('${index + 1}'),
      //               ),
      //               title: Text(item['title']),
      //               subtitle: Text(item['description']),
      //               trailing: PopupMenuButton(
      //                 onSelected: (value) {
      //                   if (value == 'edit') {
                           //Open Edit Page
      //                     navigateToEditPage(item);
      //                   } else if (value == 'delete') {
                           //Delete and remote the items
      //                     deleteById(id);
      //                   }
      //                 },
      //                 itemBuilder: (context) {
      //                   return [
      //                     const PopupMenuItem(
      //                       child: Text('Edit'),
      //                       value: 'edit',
      //                     ),
      //                     const PopupMenuItem(
      //                       child: Text('Delete'),
      //                       value: 'delete',
      //                     ),
      //                   ];
      //                 },
      //               ),
      //             ),
      //           );
      //         }
