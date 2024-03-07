import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/episodes.dart';
import 'package:sahar/features/tvs/domain/repository/base_tvs_repository.dart';

class GetEpisodesUseCase
    extends BaseUseCase<List<Episodes>, EpisodesParameters> {
  final BaseTVsRepository baseTVsRepository;

  GetEpisodesUseCase({required this.baseTVsRepository});

  @override
  Future<Either<Failure, List<Episodes>>> call(
      EpisodesParameters parameters) async {
    return await baseTVsRepository.getEpisodes(parameters);
  }
}

class EpisodesParameters extends Equatable {
  final int seriesId;
  final int seasonNumber;

  EpisodesParameters({
    required this.seriesId,
    required this.seasonNumber,
  });

  @override
  List<Object?> get props => [seriesId, seasonNumber];
}
