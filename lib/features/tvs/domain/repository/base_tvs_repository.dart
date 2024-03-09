import 'package:dartz/dartz.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/tvs/domain/entities/episodes.dart';
import 'package:sahar/features/tvs/domain/entities/recommendation.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/entities/tv_details.dart';
import 'package:sahar/features/tvs/domain/usecase/get_episodes_usecase.dart';
import 'package:sahar/features/tvs/domain/usecase/get_recommendation_tv_usecase.dart';
import 'package:sahar/features/tvs/domain/usecase/get_tv_details_usecase.dart';

abstract class BaseTVsRepository {
  Future<Either<Failure, List<TV>>> getOnTheAir();
  Future<Either<Failure, List<TV>>> getPopularTVs();
  Future<Either<Failure, List<TV>>> getTopRatedTVs();
  Future<Either<Failure, TVsDetail>> getTVsDetails(
      TVsDetailsParameter parameter);
  Future<Either<Failure, List<RecommendationTV>>> getRecommendation(
      RecommendationTVsParameters parameters);
  Future<Either<Failure, List<Episodes>>> getEpisodes(
      EpisodesParameters pramater);
}
