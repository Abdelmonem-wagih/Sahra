class AppConstance {
  static const String baseURL = "https://api.themoviedb.org/3";
  static const String apiKey = "e36863746e82bb78c9671d5a8167f9ce";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";

  //////////////////////////// Movies section ////////////////////////////
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
  static String movieVideos(int movieId) =>
      '$baseURL/movie/$movieId/videos?api_key=$apiKey';

  //////////////////////////// TV section ////////////////////////////
  static const String onTheAirTVsPath =
      "$baseURL/tv/on_the_air?api_key=$apiKey";
  static const String popularTVsPath = "$baseURL/tv/popular?api_key=$apiKey";
  static const String topRatedTVsPath = "$baseURL/tv/top_rated?api_key=$apiKey";
  static String tvDetailsPath(int seriesId) =>
      "$baseURL/tv/$seriesId?api_key=$apiKey";
  static String recommendation(int seriesId) =>
      "$baseURL/tv/$seriesId/recommendations?api_key=$apiKey";
  static String episodes(int seriesId, int seasonNumber) =>
      '$baseURL/tv/$seriesId/season/$seasonNumber?api_key=$apiKey';
}


//https://api.themoviedb.org/3/movie/{movie_id}/recommendations?api_key=e36863746e82bb78c9671d5a8167f9c
///for arabic
//https://api.themoviedb.org/3/movie/upcoming?api_key=e36863746e82bb78c9671d5a8167f9ce&language=ar
///for videos 
///https://api.themoviedb.org/3/movie/933131/videos?api_key=e36863746e82bb78c9671d5a8167f9ce