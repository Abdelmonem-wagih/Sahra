import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/features/movies/domain/entities/movie_videos.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_videos_usecase.dart';

part 'movie_videos_state.dart';

class MovieVideosCubit extends Cubit<MovieVideosState> {
  final GetMovieVideosUseCase movieVideosUseCase;
  MovieVideosCubit(this.movieVideosUseCase) : super(MovieVideosInitial());

  Future<void> getMovieVideos(int movieId) async {
    emit(MovieVideosInitial());
    final response =
        await movieVideosUseCase(MovieVideosParameter(moiveId: movieId));

    response.fold(
      (failure) => emit(
        MovieVideosFailure(
          errorMessage: 'can not fetch Movies Details Message',
        ),
      ),
      (movieVideos) {
        emit(
          MovieVideosLoaded(movieVideos: movieVideos),
        );
      },
    );
  }
}
