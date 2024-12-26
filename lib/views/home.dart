import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wall_galaxy/controller/apiOper.dart';
import 'package:wall_galaxy/model/PhotoModel.dart';
import 'package:wall_galaxy/widgets/CategoryBar.dart';
import 'package:wall_galaxy/widgets/CustomeAppBar.dart';
import 'package:wall_galaxy/widgets/CustomeSearchBar.dart';

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
        centerTitle: true,
        elevation: 0,
        title: CustomeAppBar( wordOne:  "Wall", wordTwo:  "Galaxy"),
      ),
      body:Column(
          children: [
            const CustomeSearchBar(),
            CategoryBar(),
            isLoading ? const CupertinoActivityIndicator(color: Color.fromARGB(255, 23, 93, 0), radius: 25,):
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