import 'package:api_project/Screens/home_screen.dart';
import 'package:api_project/Screens/navigation.dart';
import 'package:api_project/constants.dart';
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
        scaffoldBackgroundColor: screenColor,
        useMaterial3: true,
      ),
      home:const NavigationScreen(),
    );
  }
}
