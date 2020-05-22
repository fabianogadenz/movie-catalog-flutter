import 'package:flutter/material.dart';
import 'package:moviecatalog/ui/movie_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalogo de Filmes',
      theme: ThemeData(
        primarySwatch: Colors.black54,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieApp(),
    );
  }
}
