// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/tv_details.dart';
import 'package:sahar/features/tvs/domain/repository/base_tvs_repository.dart';

class GetTVsDetailsUseCase extends BaseUseCase<TVsDetail, TVsDetailsParameter> {
  final BaseTVsRepository baseTVsRepository;

  GetTVsDetailsUseCase(this.baseTVsRepository);

  @override
  Future<Either<Failure, TVsDetail>> call(
      TVsDetailsParameter parameters) async {
    return await baseTVsRepository.getTVsDetails(parameters);
  }
}

class TVsDetailsParameter extends Equatable {
  final int seriesId;

  const TVsDetailsParameter({
    required this.seriesId,
  });

  @override
  List<Object?> get props => [seriesId];
}
