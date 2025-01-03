import 'package:flutter/material.dart';

import 'application.dart';

void initializeApplication() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}
