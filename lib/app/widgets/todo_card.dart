import 'package:flutter/material.dart';
import 'package:taskitodo/app/model/todo_model.dart';
import 'package:taskitodo/app/viewmodel/home_viewmodel.dart';

class TodoCard extends StatefulWidget {
  final TodoModel todo;
  final HomeViewmodel homeViewmodel;
  const TodoCard({super.key, required this.todo, required this.homeViewmodel});

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
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
        subtitle: widget.todo.description == ''
            ? null
            : Text(
                widget.todo.description!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8D9CB8),
                ),
              ),
        leading: GestureDetector(
          onTap: () => widget.homeViewmodel.checkTodoAsDone(widget.todo),
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: widget.todo.isDone ? Color(0xFFC6CFDC) : null,
              border: Border.all(
                color: widget.todo.isDone
                    ? Color(0xFFC6CFDC)
                    : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: widget.todo.isDone
                ? Center(
                    child: Icon(
                      Icons.check,
                      color: Color(0xFFF5F7F9),
                      size: 20,
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey.shade400,
            )),
      ),
    );
  }
}
