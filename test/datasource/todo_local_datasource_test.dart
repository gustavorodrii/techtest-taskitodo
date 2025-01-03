import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskitodo/app/datasource/todo_local_datasource.dart';
import 'package:taskitodo/app/model/todo_model.dart';

void main() {
  late TodoLocalDatasource datasource;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    datasource = TodoLocalDatasource();
  });

  group('TodoLocalDatasource Tests', () {
    test('fetchTodos returns uncompleted todos', () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('todos', [
        jsonEncode(TodoModel(id: 1, title: 'Todo 1', isDone: false).toJson()),
        jsonEncode(TodoModel(id: 2, title: 'Todo 2', isDone: true).toJson())
      ]);

      final result = await datasource.fetchTodos();

      expect(result.isSuccess, true);
      expect(result.data?.length, 1);
      expect(result.data?[0].title, 'Todo 1');
    });

    test('fetchTodos returns empty list when no todos exist', () async {
      final result = await datasource.fetchTodos();

      expect(result.isSuccess, true);
      expect(result.data, isEmpty);
    });

    test('saveTodo adds a new todo successfully', () async {
      final newTodo = TodoModel(id: 1, title: 'New Todo', isDone: false);

      final result = await datasource.addTodo(newTodo);

      expect(result.isSuccess, true);

      final prefs = await SharedPreferences.getInstance();
      final storedTodos = prefs.getStringList('todos');
      expect(storedTodos?.length, 1);
      expect(storedTodos?.first, jsonEncode(newTodo.toJson()));
    });

    test('deleteTodo removes a todo successfully', () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('todos', [
        jsonEncode(TodoModel(id: 1, title: 'Todo 1', isDone: false).toJson()),
        jsonEncode(TodoModel(id: 2, title: 'Todo 2', isDone: true).toJson())
      ]);

      final result = await datasource.deleteTodo(1);

      expect(result, true);

      final storedTodos = prefs.getStringList('todos');
      expect(storedTodos?.length, 1);
      expect(storedTodos?.first,
          jsonEncode(TodoModel(id: 2, title: 'Todo 2', isDone: true).toJson()));
    });

    test('deleteTodo returns failure if todo ID does not exist', () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('todos', [
        jsonEncode(TodoModel(id: 1, title: 'Todo 1', isDone: false).toJson()),
      ]);

      final result = await datasource.deleteTodo(2);

      expect(!result, true);
      expect(!result, 'Todo not found');
    });

    test('updateTodo updates an existing todo successfully', () async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('todos', [
        jsonEncode(
            TodoModel(id: 1, title: 'Todo 1', description: null, isDone: false)
                .toJson()),
      ]);

      final updatedTodo = TodoModel(id: 1, title: 'Todo 1', isDone: true);
      final result = await datasource.toggleDone(updatedTodo.id);

      expect(result.isSuccess, true);

      final storedTodos = prefs.getStringList('todos');
      expect(storedTodos?.length, 1);
      expect(storedTodos?.first, jsonEncode(updatedTodo.toJson()));
    });

    test('updateTodo returns failure if todo does not exist', () async {
      final result = await datasource.toggleDone(0);

      expect(result, true);
      expect(result.error, 'Todo not found');
    });
  });
}
