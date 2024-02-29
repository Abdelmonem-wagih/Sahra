import 'package:dartz/dartz.dart';
import 'package:sahar/core/exception/exception.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/tvs/data/data_source/tv_remote_data_source.dart';
import 'package:sahar/features/tvs/domain/entities/recommendation.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/entities/tv_details.dart';
import 'package:sahar/features/tvs/domain/repository/base_tvs_repository.dart';
import 'package:sahar/features/tvs/domain/usecase/get_recommendation_tv_usecase.dart';
import 'package:sahar/features/tvs/domain/usecase/get_tv_details_usecase.dart';

class TVsRepository extends BaseTVsRepository {
  final BaseTVsRemoteDataSource baseTVsRemoteDataSource;
  TVsRepository( this.baseTVsRemoteDataSource);

  @override
  Future<Either<Failure, List<TV>>> getOnTheAir() async {
    final result = await baseTVsRemoteDataSource.getOnTheAir();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getPopularTVs() async {
    final result = await baseTVsRemoteDataSource.getPopularTVs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<RecommendationTV>>> getRecommendation(
      RecommendationTVsParameters parameters) async {
    final result = await baseTVsRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, TVsDetail>> getTVsDetails(
      TVsDetailsParameter parameter) async {
    final result = await baseTVsRemoteDataSource.getTVsDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTopRatedTVs() async {
    final result = await baseTVsRemoteDataSource.getTopRatedTVs();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMessage),
      );
    }
  }
}
