import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/widgets/completed_todo_card.dart';

import '../viewmodel/completed_viewmodel.dart';

class CompletedTodoView extends StatefulWidget {
  const CompletedTodoView({super.key});

  @override
  State<CompletedTodoView> createState() => _CompletedTodoViewState();
}

class _CompletedTodoViewState extends State<CompletedTodoView> {
  final CompletedViewmodel completedViewmodel = Get.find<CompletedViewmodel>();

  @override
  void initState() {
    super.initState();
    completedViewmodel.reloadCompletedTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed Tasks',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () => completedViewmodel.deleteAllTodos(),
                    child: Text(
                      'Delete all',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              completedViewmodel.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : completedViewmodel.completedTodoList.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 24,
                              children: [
                                Text(
                                  'You have no task listed.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                  0, 10, 0, kBottomNavigationBarHeight * 2.5),
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  completedViewmodel.completedTodoList.length,
                              itemBuilder: (context, index) {
                                var todo =
                                    completedViewmodel.completedTodoList[index];
                                return CompletedTodoCard(
                                    todo: todo,
                                    completedViewmodel: completedViewmodel);
                              }),
                        ),
            ],
          );
        }));
  }
}
