import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:moviecatalog/data/movieapi_store.dart';
import 'package:moviecatalog/models/movie.dart';
import 'package:moviecatalog/models/movie_detail.dart';
import '../data/movie_list.dart';

class BookPage extends StatefulWidget {
  final int index;
  final Movie movie;

  BookPage(this.index, this.movie);

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  double padding = 16.0;
  double radius = 24.0;

  // scroll
  double positionY = 410.0;

  // full scroll state signal
  bool isFullScrolled = false;
  String description =
      "Joker is a 2019 American psychological thriller film directed by Todd Phillips, who co-wrote the screenplay with Scott Silver. Joker is a 2019 American psychological thriller film directed by Todd Phillips, who co-wrote the screenplay with Scott Silver.  Joker is a 2019 American psychological thriller film directed by Todd Phillips, who co-wrote the screenplay with Scott Silver.  Joker is a 2019 American psychological thriller film directed by Todd Phillips, who co-wrote the screenplay with Scott Silver.  ";
  MovieApiStore movieApiStore;

  @override
  void initState() {
    super.initState();
    movieApiStore = MovieApiStore();
    movieApiStore.fetchMovie(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // max position
    double maxPositionY = screenHeight - 80.0;
    // minimun position
    double minimumPositionY = screenHeight * 0.60;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top image
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: screenHeight * 0.35,
              // use hero widget
              child: Hero(
                  tag: "movie ${widget.index}",
                  child: Image.network(
                    "http://image.tmdb.org/t/p/w500/" + widget.movie.posterPath,
                    fit: BoxFit.fill,
                  ))),
          // appbar
          Positioned(
            top: 0,
            left: padding / 2,
            right: padding / 2,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 64.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: () {
                        // back
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 28.0, color: Colors.white),
                    ),

                    isFullScrolled
                        ? Flexible(
                            fit: FlexFit.tight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                // spacer
                                Container(height: 28.0, width: 52.0),
                                // column text
                                Flexible(
                                    fit: FlexFit.tight,
                                    child: Observer(builder: (BuildContext context) {
                                      MovieDetail movie = movieApiStore.movieSelected;
                                      return (movie != null)
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                // title
                                                Expanded(
                                                  child: Text(
                                                    movie.title,
                                                    style: TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                // runtime
                                                Text(
                                                  'Duração: ${movie.runtime.toString()} minutos',
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Center(child: CircularProgressIndicator());
                                    })),
                              ],
                            ),
                          )
                        : Spacer(),
                    // right icon
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.bookmark_border, size: 28.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // white bottom container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails) {},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
                setState(() {
                  positionY -= dragDetails.delta.dy;

                  if (positionY > maxPositionY) positionY = maxPositionY;
                  if (positionY < minimumPositionY) positionY = minimumPositionY;
//                  print("positionY = $positionY");
                  if (positionY == maxPositionY)
                    isFullScrolled = true;
                  else
                    isFullScrolled = false;
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails) {
                setState(() {
                  if (positionY >= minimumPositionY + (maxPositionY - minimumPositionY) / 2)
                    positionY = maxPositionY;
                  else
                    positionY = minimumPositionY;

                  if (positionY == maxPositionY)
                    isFullScrolled = true;
                  else
                    isFullScrolled = false;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.fastOutSlowIn,
                height: positionY,
                child: Stack(
                  children: <Widget>[
                    // bottom white container
                    Positioned(
                      top: 32.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.only(top: padding * 2, left: padding, bottom: padding * 2),
                        height: maxPositionY + 50.0,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // movie title
                            isFullScrolled
                                ? Container()
                                : Container(
                                    margin: EdgeInsets.only(bottom: padding),
                                    height: 100.0,
                                    child: Observer(builder: (BuildContext context) {
                                      return (movieApiStore.movieSelected != null)
                                          ? Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                //aqui
                                                // title
                                                Text(
                                                  movieApiStore.movieSelected.title,
                                                  style: TextStyle(
                                                    fontSize: 30.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                                // genre
                                                Text(
                                                  movieApiStore.movieSelected.originalTitle,
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.5),
                                                ),

                                                // runtime
                                                Text(
                                                  "Duração: " + movieApiStore.movieSelected.runtime.toString() + " minutos",
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey[500],
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.5),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: <Widget>[
                                                Container(),
                                              ],
                                            );
                                    }),
                                  ),

                            // description
                            Container(
                              padding: EdgeInsets.only(right: padding * 2),
//                              height: 150.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Observer(builder: (BuildContext context) {
                                    return (movieApiStore.movieSelected != null)
                                        ? Text(
                                            movieApiStore.movieSelected.overview,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                height: 1.5),
                                          )
                                        : Center(child: CircularProgressIndicator());
                                  })
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // center floating btn
                    isFullScrolled
                        ? Positioned(
                            top: 42.0,
                            left: screenWidth / 2 - 24.0,
                            right: screenWidth / 2 - 24.0,
                            child: Container(
                              height: 4.0,
                              decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Colors.grey[300],
                              ),
                            ),
                          )
                        : AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn,
                            top: 0,
                            left: screenWidth / 2 - 32.0,
                            right: screenWidth / 2 - 32.0,
                            child: Container(
                              height: isFullScrolled ? 0.0 : 64.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              child: isFullScrolled
                                  ? Container()
                                  : Center(
                                      child: Icon(
                                        Icons.arrow_right,
                                        size: 64.0,
                                        color: Colors.black,
                                      ),
                                    ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),

          // bottom : buy ticket
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: padding * 2.5, left: padding, right: padding, bottom: padding),
              height: 105.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.5), Colors.white, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                children: <Widget>[
                  // buy ticket container
                  Flexible(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius / 2),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "Buy Ticket".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: padding * 2),

                  // circlualr progress
                  Flexible(
                    child: Stack(
                      children: <Widget>[
                        // circular chart
                        Positioned.fill(
                          child: Center(
                            child: CustomPaint(
                              painter: ChartPaint(),
                            ),
                          ),
                        ),

                        // center text
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              "9.1",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(0.0, 0.0), radius: 16.0);
    double startAngle = -pi / 2;
    double sweepAngle = pi * 2 * 0.91;

    var paint = Paint()
      ..color = Colors.black
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
