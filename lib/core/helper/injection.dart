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
import 'package:sahar/features/tvs/domain/usecase/get_on_the_air_tv_usecase.dart';
import 'package:sahar/features/tvs/presentation/cubit/on_the_air/on_the_air_cubit.dart';
import 'package:sahar/features/tvs/presentation/cubit/tvs_details/tvs_details_cubit.dart';

import '../../features/tvs/data/data_source/tv_remote_data_source.dart';
import '../../features/tvs/data/repository/tvs_repository.dart';
import '../../features/tvs/domain/repository/base_tvs_repository.dart';
import '../../features/tvs/domain/usecase/get_popular_tvs_usecase.dart';
import '../../features/tvs/domain/usecase/get_recommendation_tv_usecase.dart';
import '../../features/tvs/domain/usecase/get_toprated_tvs_usecase.dart';
import '../../features/tvs/domain/usecase/get_tv_details_usecase.dart';
import '../../features/tvs/presentation/cubit/popular_tvs/popular_tvs_cubit.dart';
import '../../features/tvs/presentation/cubit/recommendation_tvs/recommendation_tvs_cubit.dart';
import '../../features/tvs/presentation/cubit/toprated_tvs/top_rated_tvs_cubit.dart';


GetIt sl = GetIt.instance;

Future<void> init() async {

  ///////////////////////////////// Cubit /////////////////////////////////
                      ///Movie Cubit///
  sl.registerLazySingleton(() => NowPlayingMoviesCubit(sl()));
  sl.registerLazySingleton(() => PopularMoviesCubit(sl()));
  sl.registerLazySingleton(() => TopRatedMoviesCubit(sl()));
  sl.registerLazySingleton(() => MoviesDetailsCubit(sl()));
  sl.registerLazySingleton(() => RecommendationCubit(sl()));

                       ///TVs Cubit///
  sl.registerLazySingleton(() => OnTheAirCubit(sl()));
  sl.registerLazySingleton(() => PopularTVsCubit(sl()));
  sl.registerLazySingleton(() => TopRatedTVsCubit(sl()));
  sl.registerLazySingleton(() => TVsDetailsCubit(sl()));
  sl.registerLazySingleton(() => RecommendationTVsCubit(sl()));


  //////////////////////////////// UseCase ////////////////////////////////
                     ///Movie UseCase///
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

                       ///TVs UseCase///
  sl.registerLazySingleton(() => GetOnTheAirUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularTVsUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedTVsUseCase(sl()));
  sl.registerLazySingleton(() => GetTVsDetailsUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationTVsUseCase(sl()));

  //here we went to add baseMovieRemoteDatasource
  //but now we use SingleTon for create a simple code
  //we replace baseMovieRemoteDatasource => sl()
  //sl() mean it have object from which you went
  sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
  sl.registerLazySingleton<BaseTVsRepository>(() => TVsRepository(sl()));


  sl.registerLazySingleton<BaseMovieRemoteDatasource>(
          () => MovieRemoteDataSource());
  sl.registerLazySingleton<BaseTVsRemoteDataSource>(
          () => TVsRemoteDataSource());
}
