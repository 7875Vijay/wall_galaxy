import 'package:flutter/material.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';
import 'package:wall_galaxy/widgets/CustomeSearchBar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body: SingleChildScrollView( physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const CustomeSearchBar(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(5),
              child: GridView.builder(
                physics:const BouncingScrollPhysics(),
                itemCount: 100,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 400
                ),
                
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://images.pexels.com/photos/12086412/pexels-photo-12086412.jpeg?auto=compress&cs=tinysrgb&w=600',
                      fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
}