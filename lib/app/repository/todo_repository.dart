import 'package:taskitodo/app/model/todo_model.dart';
import 'package:taskitodo/app/service/result.dart';
import '../datasource/todo_local_datasource.dart';

class TodoRepository {
  final TodoLocalDatasource localDatasource;

  TodoRepository({required this.localDatasource});

  Future<Result<List<TodoModel>>> getTodos() {
    return localDatasource.fetchTodos();
  }

  Future<Result<TodoModel>> addTodo(TodoModel todo) {
    return localDatasource.addTodo(todo);
  }

  Future<Result<List<TodoModel>>> getCompletedTodos() {
    return localDatasource.fetchCompletedTodos();
  }

  Future<bool> deleteTodo(int id) {
    return localDatasource.deleteTodo(id);
  }

  Future<bool> deleteCompletedTodos() {
    return localDatasource.deleteCompletedTodos();
  }

  Future<Result<bool>> toggleDone(int id) {
    return localDatasource.toggleDone(id);
  }

  Future<Result<List<TodoModel>>> searchTodos(String query) {
    return localDatasource.searchTodos(query);
  }
}
