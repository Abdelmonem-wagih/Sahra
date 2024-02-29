import 'package:dio/dio.dart';
import 'package:sahar/core/exception/exception.dart';
import 'package:sahar/core/network/error_message_model.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/movies/data/models/movie_details_model.dart';
import 'package:sahar/features/movies/data/models/movie_model.dart';
import 'package:sahar/features/movies/data/models/recommendation_model.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_recommendation_usecase.dart';


abstract class BaseMovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameter parameter);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDatasource {
  final Dio dio = Dio();
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dio.get(AppConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      //how it work?? google it??
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }
  }
  
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameter parameter) async {
    final response =
    await Dio().get(AppConstance.movieDetailsPath(parameter.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameter) async {
    final response =
    await Dio().get(AppConstance.recommendationPath(parameter.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJason(response.data));
    }
  }
}
