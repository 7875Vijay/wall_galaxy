import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wall_galaxy/model/PhotoModel.dart';
class APIOperations{
  static Future<PhotoModel> getTrendingWallpapers() async{
    String apiKey = 'T3ZCuoXIbngmRMk5iXcEXCt4GwlNhMFjoi74IMO4LBgBK0rrnYY7zQKF';
    String apiUrl = 'https://api.pexels.com/v1/curated?per_page=80';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        HttpHeaders.authorizationHeader: apiKey,
      },
    );
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    final trendingPhotos = responseJson; 

    
    List<Photos> listOfPhotos = [];
    for (var photo in trendingPhotos['photos']) {

      SRC src = SRC(
        original: photo['src']['original']??'', 
        large2x: photo['src']['large2x']??'', 
        large: photo['src']['large']??'', 
        medium: photo['src']['medium']??'',
        small: photo['src']['small']??'',
        tiny: photo['src']['tiny']??'',
        portrait: photo['src']['portrait']??'',
      );

      Photos photos = Photos(
        id: photo['id'], 
        height: photo['height']??0, 
        width: photo['width']??0,
        url: photo['url']??'https://imgs.search.brave.com/bEdhPwVY999DtrOvmIRnmmMKJrDrxNNcMabCyDXr8Ss/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cHVibGljZG9tYWlu/cGljdHVyZXMubmV0/L3BpY3R1cmVzLzI4/MDAwMC92ZWxrYS9u/b3QtZm91bmQtaW1h/Z2UtMTUzODM4NjQ3/ODdsdS5qcGc',
        photographer: photo['photographer']??'',
        photographer_url: photo['photographer_url']??'', 
        photographer_id: photo['photographer_id']??0, 
        avg_color: photo['avg_color']??'', 
        src: src
      );
      listOfPhotos.add(photos);
    }

    PhotoModel photoModel = PhotoModel(
      page: trendingPhotos['page']??0, 
      per_page: trendingPhotos['per_page']??0, 
      photos: listOfPhotos
    );
    return photoModel;
  }
  static Future<PhotoModel> getSerchedWallpapers(String query) async{
    String apiKey = 'T3ZCuoXIbngmRMk5iXcEXCt4GwlNhMFjoi74IMO4LBgBK0rrnYY7zQKF';
    String apiUrl = 'https://api.pexels.com/v1/search?query=$query&per_page=80';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        HttpHeaders.authorizationHeader: apiKey,
      },
    );
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    final trendingPhotos = responseJson; 

    
    List<Photos> listOfPhotos = [];
    for (var photo in trendingPhotos['photos']) {

      SRC src = SRC(
        original: photo['src']['original']??'', 
        large2x: photo['src']['large2x']??'', 
        large: photo['src']['large']??'', 
        medium: photo['src']['medium']??'',
        small: photo['src']['small']??'',
        tiny: photo['src']['tiny']??'',
        portrait: photo['src']['portrait']??'',
      );

      Photos photos = Photos(
        id: photo['id'], 
        height: photo['height']??0, 
        width: photo['width']??0,
        url: photo['url']??'https://imgs.search.brave.com/bEdhPwVY999DtrOvmIRnmmMKJrDrxNNcMabCyDXr8Ss/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cHVibGljZG9tYWlu/cGljdHVyZXMubmV0/L3BpY3R1cmVzLzI4/MDAwMC92ZWxrYS9u/b3QtZm91bmQtaW1h/Z2UtMTUzODM4NjQ3/ODdsdS5qcGc',
        photographer: photo['photographer']??'',
        photographer_url: photo['photographer_url']??'', 
        photographer_id: photo['photographer_id']??0, 
        avg_color: photo['avg_color']??'', 
        src: src
      );
      listOfPhotos.add(photos);
    }

    PhotoModel photoModel = PhotoModel(
      page: trendingPhotos['page']??0, 
      per_page: trendingPhotos['per_page']??0, 
      photos: listOfPhotos
    );
    return photoModel;
  }
}

