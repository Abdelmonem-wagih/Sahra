import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/features/movies/domain/entities/movies_detail.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_details_usecase.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;

  MoviesDetailsCubit(this.getMovieDetailsUseCase) : super(MoviesDetailsInitial());

  Future<void> fetchMoviesDetails(int id) async {
    emit(MoviesDetailsInitial());
    final response =
    await getMovieDetailsUseCase(MovieDetailsParameter(movieId: id));

    response.fold(
          (failure) => emit(
        const MoviesDetailsFailure(
          moviesDetailsMessage: 'can not fetch Movies Details Message',
        ),
      ),
          (moviesDetails) {
        emit(
          MoviesDetailsLoaded(movieDetail: moviesDetails),
        );
      },
    );
  }
}
