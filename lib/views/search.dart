import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';

import '../controller/apiOper.dart';
import '../model/PhotoModel.dart';
import '../widgets/GridViewForWallpapers.dart';

class SearchScreen extends StatefulWidget {
  String searchQuery;
  SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late PhotoModel photoModel;
  late List<Photos> photos = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getTrendingWallpapers();
  }

  getTrendingWallpapers() async{
    var query = widget.searchQuery;
    photoModel = await APIOperations.getSerchedWallpapers(query);
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
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading ? const Center(child:  CupertinoActivityIndicator(color: Color.fromARGB(255, 23, 93, 0), radius: 25,)):
            GridViewForWallpapers(photos: photos)
          ],
        ),
    
      );
  }
}