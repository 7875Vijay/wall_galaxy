import 'package:flutter/material.dart';
import 'package:wall_galaxy/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}
//T3ZCuoXIbngmRMk5iXcEXCt4GwlNhMFjoi74IMO4LBgBK0rrnYY7zQKF
class MainApp extends StatelessWidget {
  const MainApp({super.key});
//launcher_icon
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0.0),

      ),
      
      title: "Wall Galaxy",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
