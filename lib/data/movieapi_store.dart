import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:moviecatalog/data/consts.dart';
import 'package:moviecatalog/models/movie.dart';
import 'package:moviecatalog/models/movie_detail.dart';
import 'package:moviecatalog/models/up_coming.dart';
import 'package:http/http.dart' as http;

part 'movieapi_store.g.dart';

class MovieApiStore = _MovieApiStoreBase with _$MovieApiStore;

abstract class _MovieApiStoreBase with Store {
  @observable
  UpComing _upComing;
  @computed
  UpComing get upComing => _upComing;


  @observable
  MovieDetail _movieSelected;
  @computed
  MovieDetail get movieSelected => _movieSelected;

  @action
  fetchUpcomingList() {
    _upComing = null;
    loadUpComingAPI().then((valueList) => _upComing = valueList);
  }

  @action
  fetchMovie(int id) {
    _movieSelected = null;
    loadMovieApi(id).then((value) => _movieSelected = value);
  }

  Future<UpComing> loadUpComingAPI() async {
    try {
      print(Consts.upComingURL);
      final response = await http.get(Consts.upComingURL);
      var decodeJson = jsonDecode(response.body);
      UpComing results = UpComing.fromJson(decodeJson);
      return results;
    } catch (error, e) {
      print("Erro ao carregar lista " + e.toString() + error.toString());
      return null;
    }
  }

  Future<MovieDetail> loadMovieApi(int id) async {
    try {
      print(Consts.movieDetailURL(id));
      final response = await http.get(Consts.movieDetailURL(id));
      var decodeJson = jsonDecode(response.body);
      MovieDetail movieDetail = MovieDetail.fromJson(decodeJson);
      return movieDetail;
    } catch (error, e) {
      print("Erro ao carregar movie " + e.toString() + error.toString());
      return null;
    }
  }
}
