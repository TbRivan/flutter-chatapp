import 'package:chat_app/config/app_routes.dart';
import 'package:chat_app/styles/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark),
      initialRoute: AppRoutes.login,
      routes: AppRoutes.pages,
    );
  }
}
