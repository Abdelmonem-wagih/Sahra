part of 'movies_details_cubit.dart';


abstract class MoviesDetailsState extends Equatable {
  const MoviesDetailsState();

  @override
  List<Object> get props => [];
}

class MoviesDetailsInitial extends MoviesDetailsState {}

class MoviesDetailsLoaded extends MoviesDetailsState {
  final MovieDetail movieDetail;

  const MoviesDetailsLoaded({
    required this.movieDetail,
  });

  @override
  List<Object> get props => [movieDetail];
}

class MoviesDetailsFailure extends MoviesDetailsState {
  final String moviesDetailsMessage;

  const MoviesDetailsFailure({
    required this.moviesDetailsMessage,
  });

  @override
  List<Object> get props => [moviesDetailsMessage];
}
