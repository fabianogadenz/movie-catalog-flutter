import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:moviecatalog/data/consts.dart';
import 'package:moviecatalog/models/up_coming.dart';
import 'package:http/http.dart' as http;

part 'movieapi_store.g.dart';

class MovieApiStore = _MovieApiStoreBase with _$MovieApiStore;

abstract class _MovieApiStoreBase with Store {
  @observable
  UpComing upComing;

  @action
  fetchUpcomingList() {
    upComing = null;
    loadUpComingAPI().then((valueList) => upComing = valueList);
  }

  Future<UpComing> loadUpComingAPI() async {
    try {
      print(Consts.upComingURL);
      final response = await http.get(Consts.upComingURL);
      print(response.toString());
      var decodeJson = jsonDecode(response.body);
      print(decodeJson.toString());
      UpComing results = UpComing.fromJson(decodeJson);
      print(results.totalResults);
      return results;
    } catch (error, e) {
      print("Erro ao carregar lista " + e.toString() + error.toString());
      return null;
    }
  }
}
