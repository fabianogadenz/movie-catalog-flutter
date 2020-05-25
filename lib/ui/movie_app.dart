import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviecatalog/data/movieapi_store.dart';
import 'package:moviecatalog/models/popular_movies.dart';
import 'package:moviecatalog/models/up_coming.dart';
import 'book_page.dart';
import 'bottom_tabs.dart';
import '../data/movie_list.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  List<Widget> pages;
  double radius = 24.0;
  double padding = 16.0;
  String title = "Gadenz Movies";
  String subTitle = "Novos no Brasil";

  // bottom index
  int _currentIndex = 0;

  // bottom index Function
  void _onPressed(int num) {
    setState(() {
      _currentIndex = num;
    });
  }

  // pageview controller
  PageController _pageController;
  MovieApiStore movieApiStore = MovieApiStore();

  // pageview index
  int _selectedIndex = 0;

  @override
  void initState() {
    movieApiStore.fetchUpcomingList();
    movieApiStore.fetchPopularList();

    _pageController = PageController(initialPage: _selectedIndex, viewportFraction: 0.70);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: pages[_currentIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 1,
                  )
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BottomTabs(
                    icon: Icons.photo_album,
                    text: "Feed",
                    isSelected: _currentIndex == 0,
                    onPressed: () {
                      _onPressed(0);
                    },
                  ),
                  BottomTabs(
                    icon: Icons.bookmark_border,
                    text: "Mark",
                    isSelected: _currentIndex == 1,
                    onPressed: () {
                      _onPressed(1);
                    },
                  ),
                  BottomTabs(
                    icon: Icons.person_outline,
                    text: "User",
                    isSelected: _currentIndex == 2,
                    onPressed: () {
                      _onPressed(2);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _definePages() {
    pages = [
      // initial page
//      Placeholder(color: Colors.red),
      SafeArea(
        top: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // appbar
              Container(
                padding: EdgeInsets.symmetric(horizontal: padding),
                margin: EdgeInsets.only(bottom: padding / 2),
                height: 48.0,
                child: Row(
                  children: <Widget>[
                    // title icon
                    Icon(Icons.local_movies, size: 32.0, color: Colors.black),
                    SizedBox(width: 8.0),

                    // text : title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    // icon
                    Icon(Icons.search, size: 28.0, color: Colors.black),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: padding / 2),
                margin: EdgeInsets.only(bottom: padding * 2),
                height: 400.0,
                child: Observer(builder: (BuildContext context) {
                  UpComing upComing = movieApiStore.upComing;
                  return (upComing != null)
                      ? PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: upComing.results.length,
                          controller: _pageController,
                          onPageChanged: (int selectedIndex) {
                            setState(() {
                              _selectedIndex = selectedIndex;
                            });
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => BookPage(index, upComing.results[index])));
                              },
                              child: Transform.translate(
                                offset: Offset(-padding * 3, 0.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: (_selectedIndex - index).abs().toDouble() * padding * 2),
                                  margin: EdgeInsets.only(right: padding * 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // movie poster image
                                      Hero(
                                        tag: "movie $index",
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: padding / 2),
                                          height: _selectedIndex == index ? 338.0 : 270.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(radius),
                                            image: DecorationImage(
                                              image: NetworkImage("http://image.tmdb.org/t/p/w300/" +
                                                  upComing.results[index].posterPath),
                                              fit: BoxFit.fill,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(4.0, 4.0),
                                              )
                                            ],
                                          ),
//                            child: Placeholder(),
                                        ),
                                      ),

                                      // text column
                                      Container(
                                        margin: EdgeInsets.only(left: padding),
                                        height: 40.0,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            // text : title
                                            Text(
                                              upComing.results[index].title,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            // text : genre
                                            Text(
                                              upComing.results[index].originalTitle,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(child: CircularProgressIndicator());
                }),
              ),
              Padding(
                padding: EdgeInsets.only(left: padding),
                child: Text(
                  "Mais vistos",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: padding, bottom: padding * 5),
                  height: 250.0,
                  child: Observer(builder: (BuildContext context) {
                    PopularMovies popular = movieApiStore.popular;
                    return (popular != null)
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: popular.results.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => BookPage(index, popular.results[index])));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: padding),
                                  height: 250.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage("http://image.tmdb.org/t/p/w300/" + popular.results[index].posterPath),
                                      fit: BoxFit.fill,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(2.0, 2.0),
                                      )
                                    ],
                                  ),
//                        child: Placeholder(),
                                ),
                              );
                            },
                          )
                        : Center(child: CircularProgressIndicator());
                  })),
            ],
          ),
        ),
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.teal),
    ];
  }
}
