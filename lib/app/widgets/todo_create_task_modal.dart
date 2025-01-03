import 'package:flutter/material.dart';
import 'package:taskitodo/app/viewmodel/home_viewmodel.dart';

import '../model/todo_model.dart';

class TodoCreateTaskModal {
  static void show(BuildContext context, HomeViewmodel homeViewmodel) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 42, vertical: 34),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 20,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 2,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: homeViewmodel.todoTitleController,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        hintText: "What's in your mind?",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  Icon(Icons.edit, color: Colors.grey.shade400),
                  Expanded(
                    child: TextField(
                      controller: homeViewmodel.todoDescriptionController,
                      maxLines: null,
                      minLines: 1,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      decoration: InputDecoration(
                        hintText: "Add a note...",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    var newTodo = TodoModel(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: homeViewmodel.todoTitleController.text,
                      description: homeViewmodel.todoDescriptionController.text,
                    );
                    homeViewmodel.addTodo(newTodo);
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
