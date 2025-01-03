import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/completed_todo_view.dart';
import '../view/create_todo_view.dart';
import '../view/home_view.dart';
import '../view/search_todo_view.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  final List<Widget> pages = [
    HomeView(),
    CreateTodoView(),
    SearchTodoView(),
    CompletedTodoView(),
  ];

  void changePage(int index) {
    currentIndex.value = index;
  }
}
