import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/movies/domain/entities/movie.dart';
import 'package:sahar/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:dartz/dartz.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<void> fetchPopularMovies() async {
    emit(PopularMoviesInitial());

    Either<Failure, List<Movie>> response = await getPopularMoviesUseCase(
      const NoParameters(),
    );
    debugPrint("goooooo $response");

    response.fold(
          (failure) => emit(
        const Moviesfailure(
          popularMoviesMessage: 'cant fetch Top Rated Movie',
        ),
      ),
          (movie) {
        emit(
          PopularMoviesLoaded(popularMovies: movie),
        );
      },
    );
  }
}
