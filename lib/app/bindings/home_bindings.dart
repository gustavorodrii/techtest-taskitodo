import 'package:get/get.dart';
import 'package:taskitodo/app/datasource/todo_local_datasource.dart';
import 'package:taskitodo/app/repository/user_repository.dart';
import 'package:taskitodo/app/viewmodel/home_viewmodel.dart';
import '../datasource/user_datasource.dart';
import '../repository/todo_repository.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDatasource());
    Get.lazyPut(() => UserRepository(localDatasource: Get.find()));
    Get.lazyPut(() => TodoLocalDatasource());
    Get.lazyPut(() => TodoRepository(localDatasource: Get.find()));
    Get.lazyPut(() =>
        HomeViewmodel(todoRepository: Get.find(), userRepository: Get.find()));
  }
}
