class Consts {
  static const String baseAPIUrl = "https://api.themoviedb.org/3/movie";
  static const String baseAPIKey = "d47a7a5e9973022b290344fb428b332b";
  static const String baseAPILanguage = "pt-BR";

  static const String upComingURL =
      '$baseAPIUrl/upcoming?api_key=$baseAPIKey&language=$baseAPILanguage&page=1&';

  static String movieDetailURL(int id){
    return '$baseAPIUrl/$id?api_key=$baseAPIKey&language=$baseAPILanguage';
  }

  static String popularURL =
      '$baseAPIUrl/popular?api_key=$baseAPIKey&language=pt-BR&page=1&region=BR';



}
