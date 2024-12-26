import 'package:flutter/material.dart';

class CategoryBar extends StatelessWidget {
  CategoryBar({super.key});
  var categoriesList = ['Cars', 'Dark', 'White', 'Flowers', 'Nature', 'Mountains', 'Ocean', 'Beatch', 'Men', 'Women','Sceince', 'Paints','Colors', 
  'Abstract', 'Bmw', 'Lamborgini', 'Animals', 'City'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder:(context, index) {
        String categoryName = categoriesList[index];
        return Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 0.2,
                blurStyle: BlurStyle.outer,
                spreadRadius: 2,
              ),
            ],
          ),
          
          child: ClipRRect(
            borderRadius:BorderRadius.circular(10),
            child: Stack(
              children: [
                Image.network('https://images.pexels.com/photos/2631489/pexels-photo-2631489.jpeg?auto=compress&cs=tinysrgb&w=600',
                fit: BoxFit.fill,
                width: 120,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 100, // Match the height of the image
                  alignment: Alignment.center, // Center the text
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    categoryName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },)
    );
  }
}