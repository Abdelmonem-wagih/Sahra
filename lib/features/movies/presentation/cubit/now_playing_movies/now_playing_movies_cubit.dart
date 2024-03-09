import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/movies/domain/entities/movie.dart';
import 'package:sahar/features/movies/domain/usecase/get_now_playing_movies_usecase.dart';

part 'now_playing_movies_state.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingState> {
  NowPlayingMoviesCubit(this.getNowPlayingMoviesUseCase)
      : super(NowPlayingInitial());

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  Future<void> fetchNowPlayingMovies() async {
    emit(NowPlayingInitial());

    Either<Failure, List<Movie>> response = await getNowPlayingMoviesUseCase(
      const NoParameters(),
    );

    response.fold(
          (failure) => emit(
        const NowPlayingfailure(
          nowPlayingMessage: 'can not fetch Now Playing Message',
        ),
      ),
          (movie) {
        emit(
          NowPlayingLoaded(nowPlayingMovies: movie),
        );
      },
    );
  }
}
