import 'package:moviecatalog/models/sub_image.dart';

class MovieList {
  String image;
  List<SubImage> subImage;

  String title;
  String genre;

  MovieList({this.image, this.subImage, this.title, this.genre});
}