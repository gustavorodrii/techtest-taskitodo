import 'package:get/get.dart';
import 'package:taskitodo/app/viewmodel/completed_viewmodel.dart';

import '../datasource/todo_local_datasource.dart';
import '../repository/todo_repository.dart';

class CompletedBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoLocalDatasource());
    Get.lazyPut(() => TodoRepository(localDatasource: Get.find()));
    Get.lazyPut(() => CompletedViewmodel(todoRepository: Get.find()));
  }
}
