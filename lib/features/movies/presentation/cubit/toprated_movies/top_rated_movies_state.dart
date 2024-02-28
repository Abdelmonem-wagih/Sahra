part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> topRatedMovies;

  const TopRatedMoviesLoaded({required this.topRatedMovies});
  @override
  List<Object> get props => [topRatedMovies];
}

class Moviesfailure extends TopRatedMoviesState {
  final String topRatedMessage;

  const Moviesfailure({
    required this.topRatedMessage,
  });

  @override
  List<Object> get props => [topRatedMessage];
}
