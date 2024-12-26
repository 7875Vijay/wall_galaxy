import 'package:flutter/material.dart';
import 'package:wall_galaxy/views/home.dart';

void main() {
  runApp(const MainApp());
}
//T3ZCuoXIbngmRMk5iXcEXCt4GwlNhMFjoi74IMO4LBgBK0rrnYY7zQKF
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Wall Galaxy",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
