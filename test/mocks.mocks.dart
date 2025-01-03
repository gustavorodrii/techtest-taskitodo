// Mocks generated by Mockito 5.4.5 from annotations
// in taskitodo/test/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:taskitodo/app/datasource/todo_local_datasource.dart' as _i3;
import 'package:taskitodo/app/model/todo_model.dart' as _i5;
import 'package:taskitodo/app/service/result.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<T> extends _i1.SmartFake implements _i2.Result<T> {
  _FakeResult_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [TodoLocalDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoLocalDatasource extends _i1.Mock
    implements _i3.TodoLocalDatasource {
  MockTodoLocalDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Result<List<_i5.TodoModel>>> fetchTodos() =>
      (super.noSuchMethod(
            Invocation.method(#fetchTodos, []),
            returnValue: _i4.Future<_i2.Result<List<_i5.TodoModel>>>.value(
              _FakeResult_0<List<_i5.TodoModel>>(
                this,
                Invocation.method(#fetchTodos, []),
              ),
            ),
          )
          as _i4.Future<_i2.Result<List<_i5.TodoModel>>>);

  @override
  _i4.Future<_i2.Result<_i5.TodoModel>> addTodo(_i5.TodoModel? todo) =>
      (super.noSuchMethod(
            Invocation.method(#addTodo, [todo]),
            returnValue: _i4.Future<_i2.Result<_i5.TodoModel>>.value(
              _FakeResult_0<_i5.TodoModel>(
                this,
                Invocation.method(#addTodo, [todo]),
              ),
            ),
          )
          as _i4.Future<_i2.Result<_i5.TodoModel>>);

  @override
  _i4.Future<_i2.Result<List<_i5.TodoModel>>> fetchCompletedTodos() =>
      (super.noSuchMethod(
            Invocation.method(#fetchCompletedTodos, []),
            returnValue: _i4.Future<_i2.Result<List<_i5.TodoModel>>>.value(
              _FakeResult_0<List<_i5.TodoModel>>(
                this,
                Invocation.method(#fetchCompletedTodos, []),
              ),
            ),
          )
          as _i4.Future<_i2.Result<List<_i5.TodoModel>>>);

  @override
  _i4.Future<bool> deleteTodo(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#deleteTodo, [id]),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);

  @override
  _i4.Future<bool> deleteCompletedTodos() =>
      (super.noSuchMethod(
            Invocation.method(#deleteCompletedTodos, []),
            returnValue: _i4.Future<bool>.value(false),
          )
          as _i4.Future<bool>);

  @override
  _i4.Future<_i2.Result<bool>> toggleDone(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#toggleDone, [id]),
            returnValue: _i4.Future<_i2.Result<bool>>.value(
              _FakeResult_0<bool>(this, Invocation.method(#toggleDone, [id])),
            ),
          )
          as _i4.Future<_i2.Result<bool>>);

  @override
  _i4.Future<_i2.Result<List<_i5.TodoModel>>> searchTodos(String? query) =>
      (super.noSuchMethod(
            Invocation.method(#searchTodos, [query]),
            returnValue: _i4.Future<_i2.Result<List<_i5.TodoModel>>>.value(
              _FakeResult_0<List<_i5.TodoModel>>(
                this,
                Invocation.method(#searchTodos, [query]),
              ),
            ),
          )
          as _i4.Future<_i2.Result<List<_i5.TodoModel>>>);
}
