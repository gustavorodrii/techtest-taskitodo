import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/viewmodel/create_viewmodel.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({super.key});

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final CreateViewmodel createViewmodel = Get.find<CreateViewmodel>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Create Todo Screen'),
      ),
    );
  }
}
