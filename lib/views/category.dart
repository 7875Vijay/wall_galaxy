import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controller/apiOper.dart';
import '../model/PhotoModel.dart';
import '../widgets/CustomeAppBar.dart';
import '../widgets/GridViewForWallpapers.dart';

class CategoryScreen extends StatefulWidget {
  String name;
  String url;
  CategoryScreen({super.key, required this.name, required this.url});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late PhotoModel photoModel;
  late List<Photos> photos = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getCategoryWallpapers();
  }

  getCategoryWallpapers() async{
    photoModel = await APIOperations.getSerchedWallpapers(widget.name);
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
      body:  Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: 200,
              child: Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(widget.url,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Category',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'MYPPR',
                            ),
                          ),
                          Text(widget.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MYPPR',
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            isLoading ? const Center( child: CupertinoActivityIndicator(color: Color.fromARGB(255, 23, 93, 0), radius: 25,)):
            GridViewForWallpapers(photos: photos) 
          ],
        ),
    );
  }
}