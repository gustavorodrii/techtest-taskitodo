import 'package:get/get.dart';

import '../model/todo_model.dart';
import '../repository/todo_repository.dart';

class CompletedViewmodel extends GetxController {
  final TodoRepository todoRepository;

  CompletedViewmodel({required this.todoRepository});

  Rx<bool> isLoading = false.obs;

  final List<TodoModel> completedTodoList = [];

  void reloadCompletedTodoList() {
    completedTodoList.clear();
    fetchCompletedTodoList();
  }

  void fetchCompletedTodoList() async {
    isLoading.value = true;
    var todo = await todoRepository.getCompletedTodos();

    todo.fold((sucess) {
      completedTodoList.addAll(sucess);
      isLoading.value = false;
    }, (error) {
      isLoading.value = false;
    });
  }

  void deleteTodo(int id) async {
    isLoading.value = true;

    final result = await todoRepository.deleteTodo(id);

    if (!result) {
      Get.snackbar('Error', 'Could not delete the task',
          colorText: Get.theme.snackBarTheme.actionTextColor,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor);
    }
    completedTodoList.removeWhere((element) => element.id == id);
    isLoading.value = false;

    update();
  }

  void deleteAllTodos() async {
    isLoading.value = true;

    final result = await todoRepository.deleteCompletedTodos();

    if (!result) {
      Get.snackbar('Error', 'Could not delete all tasks',
          colorText: Get.theme.snackBarTheme.actionTextColor,
          backgroundColor: Get.theme.snackBarTheme.backgroundColor);
    }

    completedTodoList.removeWhere((todo) => todo.isDone == true);
    isLoading.value = false;
  }
}
