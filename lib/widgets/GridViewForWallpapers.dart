import 'package:flutter/material.dart';
import 'package:wall_galaxy/model/PhotoModel.dart';
import 'package:wall_galaxy/views/fullScreen.dart';

class GridViewForWallpapers extends StatefulWidget {
  List<Photos> photos;
  GridViewForWallpapers({super.key, required this.photos});

  @override
  State<GridViewForWallpapers> createState() => _GridViewForWallpapersState();
}

class _GridViewForWallpapersState extends State<GridViewForWallpapers> {
  @override
  Widget build(BuildContext context) {
    List<Photos> photos = widget.photos;
    return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics:const BouncingScrollPhysics(),
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 350
                  ),
                  
                  itemBuilder: (context, index) {
                    String photoUrl = photos[index].src.portrait;
                    return InkWell(
                      onTap: () {
                        // Navigator.push(context,MaterialPageRoute(
                        //     builder: (context)=> FullScreen(url:photoUrl),
                        // ));

                        Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) => FullScreen(url:photoUrl),
                          transitionDuration: const Duration(seconds: 1),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 182, 181, 181), 
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(4, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child:Hero(
                            tag:photoUrl,
                            transitionOnUserGestures: true,
                            child: Image.network( 
                              photoUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            );
  }
}