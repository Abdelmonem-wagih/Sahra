import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sahar/core/helper/injection.dart' as di;
import 'package:sahar/core/unit/app_string.dart';
import 'package:sahar/features/movies/presentation/cubit/movie_details/movies_details_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/recommendation/recommendation_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/toprated_movies/top_rated_movies_cubit.dart';
import 'package:sahar/features/tvs/presentation/cubit/on_the_air/on_the_air_cubit.dart';

import 'features/tvs/presentation/cubit/popular_tvs/popular_tvs_cubit.dart';
import 'features/tvs/presentation/cubit/recommendation_tvs/recommendation_tvs_cubit.dart';
import 'features/tvs/presentation/cubit/toprated_tvs/top_rated_tvs_cubit.dart';
import 'features/tvs/presentation/cubit/tvs_details/tvs_details_cubit.dart';
import 'home_screen.dart';

 Future<void> main() async{
 WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
 await Future.delayed(const Duration(seconds: 3));

  FlutterNativeSplash.remove();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //////////////////////// Movies ////////////////////////
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

        //////////////////////// TVs ////////////////////////
         BlocProvider<OnTheAirCubit>(
          create: (context) =>
              di.sl<OnTheAirCubit>()..fetchOnTheAir(),
        ),
        BlocProvider<PopularTVsCubit>(
          create: (context) =>
              di.sl<PopularTVsCubit>()..fetchPopularTv(),
        ),
        BlocProvider<TopRatedTVsCubit>(
          create: (context) =>
              di.sl<TopRatedTVsCubit>()..fetchTopRatedTV(),
        ),
        BlocProvider<TVsDetailsCubit>(
          create: (context) => di.sl<TVsDetailsCubit>(),
        ),
        BlocProvider<RecommendationTVsCubit>(
          create: (context) => di.sl<RecommendationTVsCubit>(),
        ),

      ],
      child: MaterialApp(
        title: AppString.appName,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.grey.shade900,
        ),
        debugShowCheckedModeBanner: false,
        home:  HomeScreen(currentPageIndex: 0,),
      ),
    );
  }
}
