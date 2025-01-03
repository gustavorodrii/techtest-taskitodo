import 'package:get/get.dart';

import '../repository/todo_repository.dart';

class SearchViewmodel extends GetxController {
  final TodoRepository todoRepository;

  SearchViewmodel({required this.todoRepository});
}
