import 'package:flutter/material.dart';
import 'package:taskitodo/app/model/todo_model.dart';
import '../viewmodel/completed_viewmodel.dart';

class CompletedTodoCard extends StatefulWidget {
  final TodoModel todo;
  final CompletedViewmodel completedViewmodel;
  const CompletedTodoCard(
      {super.key, required this.todo, required this.completedViewmodel});

  @override
  State<CompletedTodoCard> createState() => _CompletedTodoCardState();
}

class _CompletedTodoCardState extends State<CompletedTodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.todo.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xFFC6CFDC),
            border: Border.all(
              color: Color(0xFFC6CFDC),
              width: 2,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              color: Color(0xFFF5F7F9),
              size: 20,
            ),
          ),
        ),
        trailing: IconButton(
            onPressed: () =>
                widget.completedViewmodel.deleteTodo(widget.todo.id),
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
