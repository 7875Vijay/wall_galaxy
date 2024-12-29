import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_galaxy/controller/apiOper.dart';
import 'package:wall_galaxy/model/PhotoModel.dart';
import 'package:wall_galaxy/widgets/CategoryBar.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';
import 'package:wall_galaxy/widgets/CustomeSearchBar.dart';

import '../widgets/GridViewForWallpapers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PhotoModel photoModel;
  late List<Photos> photos = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getTrendingWallpapers();
  }

  getTrendingWallpapers() async{
    photoModel = await APIOperations.getTrendingWallpapers();
    photos = photoModel.photos;
    if(photos.isNotEmpty){
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body:Column(
          children: [
            CustomeSearchBar(),
            CategoryBar(),
            isLoading ? const Center(child: CupertinoActivityIndicator(color: Color.fromARGB(255, 23, 93, 0), radius: 25,)):
            photos.isEmpty? const Center(child: Text('Ooops... result not found!'),) : 
            GridViewForWallpapers(photos: photos)
            ],
        ),
    );
  }
}