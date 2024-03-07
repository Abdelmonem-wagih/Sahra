import 'package:dartz/dartz.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/movies/domain/entities/movie.dart';
import 'package:sahar/features/movies/domain/entities/movie_videos.dart';
import 'package:sahar/features/movies/domain/entities/movies_detail.dart';
import 'package:sahar/features/movies/domain/entities/recommendation.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_videos_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameter parameter);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
  Future<Either<Failure,List<MovieVideos>>> getMovieVideos(MovieVideosParameter parameter);
}
