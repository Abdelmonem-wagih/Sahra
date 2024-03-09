import 'package:dartz/dartz.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/repository/base_tvs_repository.dart';

class GetPopularTVsUseCase extends BaseUseCase<List<TV>, NoParameters> {
  final BaseTVsRepository baseTVsRepository;

  GetPopularTVsUseCase( this.baseTVsRepository);

  @override
  Future<Either<Failure, List<TV>>> call(NoParameters parameters) async {
    return await baseTVsRepository.getPopularTVs();
  }
}
