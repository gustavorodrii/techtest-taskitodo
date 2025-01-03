import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/viewmodel/search_viewmodel.dart';

class SearchTodoView extends StatefulWidget {
  const SearchTodoView({super.key});

  @override
  State<SearchTodoView> createState() => _SearchTodoViewState();
}

class _SearchTodoViewState extends State<SearchTodoView> {
  final SearchViewmodel searchViewmodel = Get.find<SearchViewmodel>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Search Todo Screen'),
      ),
    );
  }
}
