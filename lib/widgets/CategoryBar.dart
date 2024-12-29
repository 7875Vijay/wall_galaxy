import 'package:flutter/material.dart';
import 'package:wall_galaxy/views/category.dart';

class CategoryBar extends StatelessWidget {
  CategoryBar({super.key});
  var categoriesList = [
    {
      'name': 'Cars',
      'url':'https://images.pexels.com/photos/2631489/pexels-photo-2631489.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Dark',
      'url':'https://images.pexels.com/photos/1097456/pexels-photo-1097456.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'White',
      'url':'https://images.pexels.com/photos/911758/pexels-photo-911758.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Flower',
      'url':'https://images.pexels.com/photos/593655/pexels-photo-593655.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Nature',
      'url':'https://images.pexels.com/photos/147411/italy-mountains-dawn-daybreak-147411.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Mountain',
      'url':'https://images.pexels.com/photos/1054218/pexels-photo-1054218.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Ocean',
      'url':'https://images.pexels.com/photos/1533720/pexels-photo-1533720.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Beatch',
      'url':'https://images.pexels.com/photos/1174732/pexels-photo-1174732.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Women',
      'url':'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Men',
      'url':'https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Sceince',
      'url':'https://images.pexels.com/photos/2280571/pexels-photo-2280571.jpeg?auto=compress&cs=tinysrgb&w=600',
    }, 
    {
      'name': 'Computer',
      'url':'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Paints',
      'url':'https://images.pexels.com/photos/1213431/pexels-photo-1213431.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Colors',
      'url':'https://images.pexels.com/photos/1616403/pexels-photo-1616403.jpeg?auto=compress&cs=tinysrgb&w=600',
    }, 
    {
      'name': 'Abstract',
      'url':'https://images.pexels.com/photos/1103970/pexels-photo-1103970.jpeg?auto=compress&cs=tinysrgb&w=600',
    }, 
    {
      'name': 'Bmw',
      'url':'https://images.pexels.com/photos/2127024/pexels-photo-2127024.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Lamborgini',
      'url':'https://images.pexels.com/photos/12926079/pexels-photo-12926079.jpeg?auto=compress&cs=tinysrgb&w=600',
    }, 
    {
      'name': 'Animals',
      'url':'https://images.pexels.com/photos/792381/pexels-photo-792381.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'City',
      'url':'https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Army',
      'url':'https://images.pexels.com/photos/876344/pexels-photo-876344.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Plane',
      'url':'https://images.pexels.com/photos/981899/pexels-photo-981899.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Ship',
      'url':'https://images.pexels.com/photos/1036866/pexels-photo-1036866.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Guns',
      'url':'https://images.pexels.com/photos/889709/pexels-photo-889709.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Dogs',
      'url':'https://images.pexels.com/photos/733416/pexels-photo-733416.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    {
      'name': 'Cats',
      'url':'https://images.pexels.com/photos/127027/pexels-photo-127027.jpeg?auto=compress&cs=tinysrgb&w=600',
    },
    ];
  String notFoundImage = 'https://imgs.search.brave.com/1Ndrcvo4NgB8EzJe6cJmYhQD15j4RAPEyzy2mg8NrUE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cHVibGljZG9tYWlu/cGljdHVyZXMubmV0/L3BpY3R1cmVzLzI4/MDAwMC92ZWxrYS9u/b3QtZm91bmQtaW1h/Z2UtMTUzODM4NjQ3/ODdsdS5qcGc';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder:(context, index) {
        var category = categoriesList[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(name: category['name']??'', url: category['url']??notFoundImage)));
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: ClipRRect(
            borderRadius:BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(category['url']??notFoundImage,
                fit: BoxFit.fill,
                width: 120,
                ),
                Container(
                  width: 120,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center, // Center the text
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    category['name']??'',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'MYPPR',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
                    ),
          ),
                
        );
      },)
    );
  }
}