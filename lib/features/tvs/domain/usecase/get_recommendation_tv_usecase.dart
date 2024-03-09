import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/recommendation.dart';

import 'package:sahar/features/tvs/domain/repository/base_tvs_repository.dart';

class GetRecommendationTVsUseCase
    extends BaseUseCase<List<RecommendationTV>, RecommendationTVsParameters> {
  final BaseTVsRepository baseTVsRepository;

  GetRecommendationTVsUseCase( this.baseTVsRepository);

  @override
  Future<Either<Failure, List<RecommendationTV>>> call(
      RecommendationTVsParameters parameters) async {
    return await baseTVsRepository.getRecommendation(parameters);
  }
}

class RecommendationTVsParameters extends Equatable {
  final int id;

  const RecommendationTVsParameters({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
