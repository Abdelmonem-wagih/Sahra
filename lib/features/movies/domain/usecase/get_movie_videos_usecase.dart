import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/movies/domain/entities/movie_videos.dart';
import 'package:sahar/features/movies/domain/repository/base_movies_repository.dart';

class GetMovieVideosUseCase
    extends BaseUseCase<List<MovieVideos>, MovieVideosParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieVideosUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieVideos>>> call(
      MovieVideosParameter parameters) async {
    return await baseMoviesRepository.getMovieVideos(parameters);
  }
}

class MovieVideosParameter extends Equatable {
  final int moiveId;

  MovieVideosParameter({required this.moiveId});

  @override
  List<Object?> get props => [moiveId];
}
