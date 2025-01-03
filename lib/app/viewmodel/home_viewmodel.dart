import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/model/todo_model.dart';
import 'package:taskitodo/app/repository/todo_repository.dart';
import 'package:taskitodo/app/repository/user_repository.dart';

class HomeViewmodel extends GetxController {
  final TodoRepository todoRepository;
  final UserRepository userRepository;
  final TextEditingController todoTitleController = TextEditingController();
  final TextEditingController todoDescriptionController =
      TextEditingController();

  HomeViewmodel({required this.userRepository, required this.todoRepository});
  var userName = ''.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isSearchVisible = false.obs;
  RxList todoList = <TodoModel>[].obs;
  RxList filteredTodoList = <TodoModel>[].obs;
  var searchQuery = ''.obs;
  void clearTextFields() {
    todoTitleController.clear();
    todoDescriptionController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    fetchUser();
    fetchTodoList();
  }

  void fetchUser() async {
    isLoading.value = true;
    var user = await userRepository.getUser();
    user.fold((sucess) {
      userName.value = sucess.name!;
      isLoading.value = false;
      update();
    }, (error) {
      isLoading.value = false;
    });
  }

  void fetchTodoList() async {
    isLoading.value = true;
    var todos = await todoRepository.getTodos();
    todos.fold((sucess) {
      todoList.addAll(sucess);
      filteredTodoList.value = todoList;
      isLoading.value = false;
      update();
    }, (error) {
      isLoading.value = false;
    });
  }

  void addTodo(TodoModel newTodo) async {
    isLoading.value = true;
    var todo = await todoRepository.addTodo(newTodo);

    todo.fold((sucess) {
      Get.back();
      clearTextFields();
      todoList.add(sucess);
      filteredTodoList.value = todoList;

      isLoading.value = false;
      update();
    }, (error) {
      isLoading.value = false;
    });
  }

  void checkTodoAsDone(TodoModel todo) async {
    isLoading.value = true;
    var result = await todoRepository.toggleDone(todo.id);

    result.fold((sucess) {
      todoList.removeWhere((element) => element.id == todo.id);
      isLoading.value = false;
      update();
    }, (error) {
      isLoading.value = false;
    });
  }

  void searchTodos(String query) async {
    searchQuery.value = query;
    isLoading.value = true;

    var result = await todoRepository.searchTodos(query);

    result.fold((success) {
      filteredTodoList.value = success;
      isLoading.value = false;
      update();
    }, (error) {
      isLoading.value = false;
      update();
    });
  }

  void toggleVissible() {
    isSearchVisible.value = !isSearchVisible.value;
  }

  void clearSearchQuery() {
    searchQuery.value = '';
    isSearchVisible.value = false;
    filteredTodoList.value = todoList;
  }
}
