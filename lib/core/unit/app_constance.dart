class AppConstance {
  static const String baseURL = "https://api.themoviedb.org/3";
  static const String apiKey = "e36863746e82bb78c9671d5a8167f9ce";
  static const String nowPlayingMoviesPath =
      "$baseURL/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseURL/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseURL/movie/top_rated?api_key=$apiKey";

  static String movieDetailsPath(int movieId) =>
      "$baseURL/movie/$movieId?api_key=$apiKey";
  static String recommendationPath(int movieId) =>
      "$baseURL/movie/$movieId/recommendations?api_key=$apiKey";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";

//for Play Trailer from youtube
  static const String baseYoueTube = 'https://www.youtube.com/watch?v=';
  static String youtube(String key) => '$baseURL$key';
}
//https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=e36863746e82bb78c9671d5a8167f9c
