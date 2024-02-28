import 'package:get_it/get_it.dart';
import 'package:sahar/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:sahar/features/movies/data/repository/movies_repository.dart';
import 'package:sahar/features/movies/domain/repository/base_movies_repository.dart';
import 'package:sahar/features/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:sahar/features/movies/domain/usecase/get_toprated_movies_usecase.dart';
import 'package:sahar/features/movies/presentation/cubit/movie_details/movies_details_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/now_playing_movies/now_playing_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/recommendation/recommendation_cubit.dart';
import 'package:sahar/features/movies/presentation/cubit/toprated_movies/top_rated_movies_cubit.dart';


GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => NowPlayingMoviesCubit(sl()));
  sl.registerLazySingleton(() => PopularMoviesCubit(sl()));
  sl.registerLazySingleton(() => TopRatedMoviesCubit(sl()));
  sl.registerLazySingleton(() => MoviesDetailsCubit(sl()));
  sl.registerLazySingleton(() => RecommendationCubit(sl()));


  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

  //here we went to add baseMovieRemoteDatasource
  //but now we use SingleTon for create a simple code
  //we replace baseMovieRemoteDatasource => sl()
  //sl() mean it have object from which you went
  sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

  sl.registerLazySingleton<BaseMovieRemoteDatasource>(
          () => MovieRemoteDataSource());
}
