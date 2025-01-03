import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';
import '../viewmodel/home_viewmodel.dart';
import 'todo_create_task_modal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NavigationController navigationController =
      Get.find<NavigationController>();

  final HomeViewmodel homeViewmodel = Get.find<HomeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: AppBar(
              backgroundColor: Colors.white,
              leadingWidth: 100,
              leading: SvgPicture.asset(
                'assets/logo/logo.svg',
              ),
              actions: [
                Text(
                  'John',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 14),
                ClipOval(
                  child: Image.asset(
                    'assets/profile/profile_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(26),
          child: navigationController
              .pages[navigationController.currentIndex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) {
            if (index == 1) {
              TodoCreateTaskModal.show(context, homeViewmodel);
            } else if (index == 2) {
              homeViewmodel.toggleVissible();
            } else {
              navigationController.changePage(index);
            }
          },
          selectedItemColor: Colors.blue,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/todo/todo.png'),
              label: 'Todo',
              activeIcon:
                  Image.asset('assets/todo/todo.png', color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/todo/create.png'),
              label: 'Create',
              activeIcon:
                  Image.asset('assets/todo/create.png', color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/todo/search.png'),
              label: 'Search',
              activeIcon:
                  Image.asset('assets/todo/search.png', color: Colors.blue),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/todo/done.png'),
              label: 'Done',
              activeIcon:
                  Image.asset('assets/todo/done.png', color: Colors.blue),
            ),
          ],
        ),
      );
    });
  }
}
