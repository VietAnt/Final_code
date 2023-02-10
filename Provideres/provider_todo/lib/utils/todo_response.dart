import 'package:provider_todo/models/todo.dart';

//TodoResponse: Phản hồi việc cần làm
class TodoResponse {
  final List<Todo> todos;
  final String apiMore;
  TodoResponse(this.todos, this.apiMore);
}
