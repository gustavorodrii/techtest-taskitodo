import 'package:get/get.dart';
import 'package:taskitodo/app/datasource/user_datasource.dart';
import 'package:taskitodo/app/repository/user_repository.dart';
import 'package:taskitodo/app/viewmodel/completed_viewmodel.dart';
import 'package:taskitodo/app/viewmodel/create_viewmodel.dart';
import '../viewmodel/main_view_model.dart';
import '../datasource/todo_local_datasource.dart';
import '../repository/todo_repository.dart';
import '../viewmodel/home_viewmodel.dart';
import '../viewmodel/search_viewmodel.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationViewModel());
    Get.lazyPut(() => TodoLocalDatasource());
    Get.lazyPut(() => UserDatasource());
    Get.lazyPut(() => UserRepository(localDatasource: Get.find()));
    Get.lazyPut(() => TodoRepository(localDatasource: Get.find()));
    Get.lazyPut(() =>
        HomeViewmodel(todoRepository: Get.find(), userRepository: Get.find()));
    Get.lazyPut(() => CreateViewmodel(todoRepository: Get.find()));
    Get.lazyPut(() => SearchViewmodel(todoRepository: Get.find()));
    Get.lazyPut(() => CompletedViewmodel(todoRepository: Get.find()));
  }
}
