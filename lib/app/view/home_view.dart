import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/viewmodel/home_viewmodel.dart';
import 'package:taskitodo/app/widgets/todo_card.dart';
import 'package:taskitodo/app/widgets/todo_create_task_modal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewmodel homeViewmodel = Get.find<HomeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: homeViewmodel.isSearchVisible.value,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  autofocus: true,
                  onChanged: homeViewmodel.searchTodos,
                  decoration: InputDecoration(
                    hintText: 'Search tasks',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: homeViewmodel.searchQuery.value.isEmpty
                        ? null
                        : GestureDetector(
                            onTap: () => homeViewmodel.clearSearchQuery(),
                            child: Icon(Icons.close),
                          ),
                  ),
                ),
              ),
            ),
            if (!homeViewmodel.isSearchVisible.value) ...[
              homeViewmodel.isLoading.value
                  ? LinearProgressIndicator()
                  : RichText(
                      text: TextSpan(
                        text: 'Welcome,',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ${homeViewmodel.userName.value}.',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
              Text(
                "You've got ${homeViewmodel.filteredTodoList.length} tasks to do.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            homeViewmodel.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : homeViewmodel.filteredTodoList.isEmpty
                    ? Expanded(
                        child: Center(
                          child: homeViewmodel.searchQuery.value.isNotEmpty
                              ? Column(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        'assets/todo/empty_todo_list.png'),
                                    Text(
                                      'No results found for "${homeViewmodel.searchQuery.value}".',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              : Column(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                        'assets/todo/empty_todo_list.png'),
                                    Text(
                                      'You have no task listed.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(12),
                                        backgroundColor:
                                            // ignore: deprecated_member_use
                                            Color(0xFF007FFF).withOpacity(.1),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () => TodoCreateTaskModal.show(
                                          context, homeViewmodel),
                                      label: Text(
                                        'Create task',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 26,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(
                              0, 10, 0, kBottomNavigationBarHeight * 2.5),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: homeViewmodel.filteredTodoList.length,
                          itemBuilder: (context, index) {
                            var todo = homeViewmodel.filteredTodoList[index];
                            return TodoCard(
                                todo: todo, homeViewmodel: homeViewmodel);
                          },
                        ),
                      ),
          ],
        );
      }),
    );
  }
}
