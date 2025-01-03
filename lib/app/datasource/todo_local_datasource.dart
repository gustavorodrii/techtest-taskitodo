import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/todo_model.dart';
import '../service/result.dart';

class TodoLocalDatasource {
  static const String _todosKey = 'todos';

  Future<Result<List<TodoModel>>> fetchTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final todos = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .where((todo) => !todo.isDone)
          .toList();
      return Result.success(todos);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<TodoModel>> addTodo(TodoModel todo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      todosJson.add(jsonEncode(todo.toJson()));
      await prefs.setStringList(_todosKey, todosJson);
      return Result.success(todo);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<List<TodoModel>>> fetchCompletedTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final completedTodos = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .where((todo) => todo.isDone)
          .toList();
      return Result.success(completedTodos);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<bool> deleteTodo(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final updatedTodosJson = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .where((todo) => todo.id != id)
          .map((todo) => jsonEncode(todo.toJson()))
          .toList();
      await prefs.setStringList(_todosKey, updatedTodosJson);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteCompletedTodos() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final updatedTodosJson = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .where((todo) => !todo.isDone)
          .map((todo) => jsonEncode(todo.toJson()))
          .toList();
      await prefs.setStringList(_todosKey, updatedTodosJson);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Result<bool>> toggleDone(int id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final updatedTodosJson = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .map((todo) {
            if (todo.id == id) {
              todo.toggleDone();
            }
            return todo;
          })
          .map((todo) => jsonEncode(todo.toJson()))
          .toList();
      await prefs.setStringList(_todosKey, updatedTodosJson);
      return Result.success(true);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<List<TodoModel>>> searchTodos(String query) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final todosJson = prefs.getStringList(_todosKey) ?? [];
      final todos = todosJson
          .map((json) => TodoModel.fromJson(jsonDecode(json)))
          .where(
              (todo) => todo.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return Result.success(todos);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
