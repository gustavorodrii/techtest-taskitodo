import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:taskitodo/app/model/todo_model.dart';
import 'package:taskitodo/app/service/result.dart';
import 'package:taskitodo/app/repository/todo_repository.dart';
import 'mocks.mocks.dart';

void main() {
  late TodoRepository repository;
  late MockTodoLocalDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockTodoLocalDatasource();
    repository = TodoRepository(localDatasource: mockDatasource);
  });

  group('TodoRepository Tests', () {
    test('getTodos returns list of todos', () async {
      when(mockDatasource.fetchTodos()).thenAnswer((_) async => Result.success(
          [TodoModel(id: 1, title: 'Test Todo', isDone: false)]));

      final result = await repository.getTodos();

      expect(result.isSuccess, true);
      expect(result.data?.length, 1);
      verify(mockDatasource.fetchTodos()).called(1);
    });
  });
}
