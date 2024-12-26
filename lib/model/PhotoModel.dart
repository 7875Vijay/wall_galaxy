class PhotoModel{
  int page;
  int per_page;
  List<Photos> photos;

  PhotoModel({
    required this.page,
    required this.per_page,
    required this.photos
  });
}

class Photos {
  int id;
  int height;
  int width;
  String url;
  String photographer;
  String photographer_url;
  int photographer_id;
  String avg_color;
  SRC src;

  Photos({
    required this.id,
    required this.height,
    required this.width,
    required this.url,
    required this.photographer,
    required this.photographer_url,
    required this.photographer_id,
    required this.avg_color,
    required this.src,
  });
}

class SRC{
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String tiny;
  String portrait;
  SRC({
    required this.original,
    required this.large2x,
    required this.large, 
    required this.medium,
    required this.small,
    required this.tiny,
    required this.portrait,
  });
}