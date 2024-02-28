part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Movie> popularMovies;

  const PopularMoviesLoaded({required this.popularMovies});
  @override
  List<Object> get props => [popularMovies];
}

class Moviesfailure extends PopularMoviesState {
  final String popularMoviesMessage;

  const Moviesfailure({
    required this.popularMoviesMessage,
  });

  @override
  List<Object> get props => [popularMoviesMessage];
}
