import 'package:flutter/material.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';
import 'package:wall_galaxy/widgets/CustomeSearchBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body: Column(
        children: [
          CustomeSearchBar()
        ],
      ),
    );
  }
}