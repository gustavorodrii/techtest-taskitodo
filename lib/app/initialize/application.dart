import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskitodo/app/routes/app_routes.dart';
import 'package:taskitodo/app/routes/routes_config.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taski To Do',
      getPages: RoutesConfig.routes,
      initialRoute: AppRoutes.mainScreen,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
