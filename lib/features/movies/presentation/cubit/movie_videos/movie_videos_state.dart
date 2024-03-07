part of 'movie_videos_cubit.dart';

abstract class MovieVideosState extends Equatable {
  const MovieVideosState();

  @override
  List<Object> get props => [];
}

class MovieVideosInitial extends MovieVideosState {}

class MovieVideosLoaded extends MovieVideosState {
  final List<MovieVideos> movieVideos;
  MovieVideosLoaded({required this.movieVideos});

  @override
  List<Object> get props => [movieVideos];
}

class MovieVideosFailure extends MovieVideosState {
  final String errorMessage;
  MovieVideosFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
