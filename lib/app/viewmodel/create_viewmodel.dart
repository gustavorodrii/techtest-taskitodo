import 'package:get/get.dart';

import '../repository/todo_repository.dart';

class CreateViewmodel extends GetxController {
  final TodoRepository todoRepository;

  CreateViewmodel({required this.todoRepository});
}
