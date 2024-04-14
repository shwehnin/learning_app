import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learning_app/app/pages/home/home_page.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learing Appp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
