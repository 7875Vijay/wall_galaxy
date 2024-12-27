import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';
import 'package:wall_galaxy/widgets/CustomeSearchBar.dart';

import '../controller/apiOper.dart';
import '../model/PhotoModel.dart';

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
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body: Column(
          children: [
            CustomeSearchBar(),
            isLoading ? const CupertinoActivityIndicator(color: Color.fromARGB(255, 23, 93, 0), radius: 25,):
            photos.length == 0? Center(child: Text('Ooops... result not found!'),) : 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics:const BouncingScrollPhysics(),
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 400
                  ),
                  
                  itemBuilder: (context, index) {
                    String photoUrl = photos[index].src.portrait;
                    return SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:Image.network( 
                          photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

            ),
          
            ],
        ),
    
      );
  }
}