import 'package:moviecatalog/models/movie_list.dart';
import 'package:moviecatalog/models/sub_image.dart';

List<MovieList> movieList = [
  MovieList(
    image: "assets/movie00.jpg",
    subImage: [
      SubImage(
        image: "assets/movie01.jpg",
        image1: "assets/movie02.jpeg",
        image2: "assets/movie02.jpeg",
      ),
    ],
    title: "Joker",
    genre: "Crime, Drama, Thriller",
  ),

  MovieList(
    image: "assets/movie10.jpg",
    subImage: [
      SubImage(
        image: "assets/movie11.jpg",
        image1: "assets/movie12.jpg",
        image2: "assets/movie12.jpg",
      ),
    ],
    title: "John Wick",
    genre: "genero 4",
  ),

  MovieList(
    image: "assets/movie20.jpg",
    subImage: [
      SubImage(
        image: "assets/movie20.jpg",
        image1: "assets/movie20.jpg",
        image2: "assets/movie20.jpg",
      ),
    ],
    title: "Ad astra",
    genre: "genero 2",
  ),

  MovieList(
    image: "assets/movie30.jpg",
    subImage: [
      SubImage(
        image: "assets/movie30.jpg",
        image1: "assets/movie30.jpg",
        image2: "assets/movie30.jpg",
      ),
    ],
    title: "titulo",
    genre: "genero 3",
  ),
];