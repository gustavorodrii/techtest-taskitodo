import 'package:get/get.dart';
import 'package:taskitodo/app/viewmodel/search_viewmodel.dart';

import '../datasource/todo_local_datasource.dart';
import '../repository/todo_repository.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoLocalDatasource());
    Get.lazyPut(() => TodoRepository(localDatasource: Get.find()));
    Get.lazyPut(() => SearchViewmodel(todoRepository: Get.find()));
  }
}
