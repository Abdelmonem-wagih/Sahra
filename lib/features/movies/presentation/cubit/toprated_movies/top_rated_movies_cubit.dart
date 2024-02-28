import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/movies/domain/entities/movie.dart';
import 'package:sahar/features/movies/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:dartz/dartz.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  TopRatedMoviesCubit(this.getTopRatedMoviesUseCase) : super(TopRatedMoviesInitial());

  Future<void> fetchTopRatedMovies() async {
    emit(TopRatedMoviesInitial());

    Either<Failure, List<Movie>> response = await getTopRatedMoviesUseCase(
      const NoParameters(),
    );
    debugPrint("goooooo $response");

    response.fold(
          (failure) => emit(
        const Moviesfailure(
          topRatedMessage: 'cant fetch Top Rated Movie',
        ),
      ),
          (movie) {
        emit(
          TopRatedMoviesLoaded(topRatedMovies: movie),
        );
      },
    );
  }

}
