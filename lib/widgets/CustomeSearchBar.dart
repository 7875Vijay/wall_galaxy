// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255,25, 25, 0), width: 1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0.2,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 5, right: 5),
                    border: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Color.fromARGB(255,25, 25, 0), fontSize: 15,)
                  ),
                  autocorrect: true,
                  cursorColor: Color.fromARGB(255,25, 25, 0),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  
                ),
              ),
              Icon(Icons.search, size: 25, color: Color.fromARGB(255,25, 25, 0),),
            ],
          ),
        ),
      ),
    );

  }
}