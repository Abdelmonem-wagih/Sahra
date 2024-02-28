import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/helper/injection.dart' as di;
import 'package:sahar/core/unit/app_string.dart';
import 'package:sahar/features/movies/presentation/cubit/movie_details/movies_details_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/recommendation/recommendation_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/toprated_movies/top_rated_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/screens/movies_screen.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesCubit>(
          create: (context) =>
              di.sl<NowPlayingMoviesCubit>()..fetchNowPlayingMovies(),
        ),
        BlocProvider<PopularMoviesCubit>(
          create: (context) =>
              di.sl<PopularMoviesCubit>()..fetchPopularMovies(),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (context) =>
              di.sl<TopRatedMoviesCubit>()..fetchTopRatedMovies(),
        ),
        BlocProvider<MoviesDetailsCubit>(
          create: (context) => di.sl<MoviesDetailsCubit>(),
        ),
        BlocProvider<RecommendationCubit>(
          create: (context) => di.sl<RecommendationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: AppString.appName,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        debugShowCheckedModeBanner: false,
        home: const MoviesScreen(),
      ),
    );
  }
}
