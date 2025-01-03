import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taskitodo/app/model/todo_model.dart';
import 'package:taskitodo/app/repository/todo_repository.dart';
import 'package:taskitodo/app/service/result.dart';

import '../mocks.mocks.dart';

void main() {
  late TodoRepository repository;
  late MockTodoLocalDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockTodoLocalDatasource();
    repository = TodoRepository(localDatasource: mockDatasource);
  });

  group('TodoRepository Tests', () {
    test('getTodos returns a list of todos when datasource is successful',
        () async {
      // Arrange
      final mockTodos = [
        TodoModel(id: 1, title: 'Test Todo 1', isDone: false),
        TodoModel(id: 2, title: 'Test Todo 2', isDone: true),
      ];
      when(mockDatasource.fetchTodos())
          .thenAnswer((_) async => Result.success(mockTodos));

      // Act
      final result = await repository.getTodos();

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, isNotNull);
      expect(result.data?.length, 2);
      expect(result.data?[0].title, 'Test Todo 1');
      verify(mockDatasource.fetchTodos()).called(1);
    });

    test('getTodos returns an error when datasource fails', () async {
      // Arrange
      const errorMessage = 'Failed to fetch todos';
      when(mockDatasource.fetchTodos())
          .thenAnswer((_) async => Result.failure(errorMessage));

      // Act
      final result = await repository.getTodos();

      // Assert
      expect(result.error, true);
      expect(result.error, errorMessage);
      verify(mockDatasource.fetchTodos()).called(1);
    });

    test('addTodo calls the datasource to save a todo', () async {
      // Arrange
      final newTodo = TodoModel(id: 3, title: 'New Todo', isDone: false);
      when(mockDatasource.addTodo(newTodo))
          .thenAnswer((_) async => Result.success(newTodo));

      // Act
      final result = await repository.addTodo(newTodo);

      // Assert
      expect(result.isSuccess, true);
      verify(mockDatasource.addTodo(newTodo)).called(1);
    });

    test('deleteTodo calls the datasource to delete a todo', () async {
      // Arrange
      const todoId = 1;
      when(mockDatasource.deleteTodo(todoId)).thenAnswer((_) async => true);

      // Act
      final result = await repository.deleteTodo(todoId);

      // Assert
      expect(result, true);
      verify(mockDatasource.deleteTodo(todoId)).called(1);
    });
  });
}
