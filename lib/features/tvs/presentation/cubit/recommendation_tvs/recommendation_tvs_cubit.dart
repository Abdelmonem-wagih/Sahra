import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/tvs/domain/entities/recommendation.dart';
import 'package:sahar/features/tvs/domain/usecase/get_recommendation_tv_usecase.dart';

part 'recommendation_tvs_state.dart';

class RecommendationTVsCubit extends Cubit<RecommendationTVsState> {
  final GetRecommendationTVsUseCase getRecommendationTVsUseCase;
  RecommendationTVsCubit(this.getRecommendationTVsUseCase)
      : super(RecommendationTVsInitial());

  Future<void> fetchRecommendationTV(int id) async {
    emit(RecommendationTVsInitial());

    Either<Failure, List<RecommendationTV>> response =
        await getRecommendationTVsUseCase(RecommendationTVsParameters(id: id));

    response.fold(
      (failure) => emit(
        RecommendationTVsFailure(
            recommendationMessage: 'can not fetch Recommendation TVs'),
      ),
      (recommendation) => emit(
        RecommendationTVsLoaded(recommendation: recommendation),
      ),
    );
  }
}
