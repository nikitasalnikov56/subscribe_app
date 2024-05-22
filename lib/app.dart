import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/routes/app_navigator.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigator.router,
    );
  }
}
