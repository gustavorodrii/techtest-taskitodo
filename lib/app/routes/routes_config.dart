import 'package:get/get.dart';
import 'package:taskitodo/app/bindings/completed_bindings.dart';
import 'package:taskitodo/app/routes/app_routes.dart';
import 'package:taskitodo/app/view/completed_todo_view.dart';
import 'package:taskitodo/app/view/home_view.dart';
import '../bindings/home_bindings.dart';
import '../bindings/navigation_bindings.dart';
import '../widgets/main_screen.dart';

class RoutesConfig {
  static final routes = [
    GetPage(
      name: AppRoutes.mainScreen,
      page: () => const MainScreen(),
      binding: NavigationBinding(),
    ),
    GetPage(
        name: AppRoutes.homeTodo,
        page: () => HomeView(),
        binding: HomeBindings()),
    GetPage(
      name: AppRoutes.completedTodo,
      page: () => const CompletedTodoView(),
      binding: CompletedBindings(),
    ),
  ];
}
