// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeAppBar extends StatelessWidget {
  String wordOne;
  String wordTwo;
  CustomeAppBar({
    super.key, 
    required this.wordOne, 
    required this.wordTwo
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        softWrap: true,
        maxLines: 1,
        text: TextSpan(
        style: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        children: [

          TextSpan(text: "$wordOne ",
          style: const TextStyle(
            color: Color.fromARGB(255, 23, 93, 0),
          )),
          
          TextSpan(text: wordTwo, 
          style: const TextStyle(
            color: Color.fromARGB(255, 233, 196, 12),
          )),

        ]
      )),
    );
  }
}