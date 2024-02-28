import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/movies/domain/entities/recommendation.dart';
import 'package:sahar/features/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:dartz/dartz.dart';
part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit(this.getRecommendationUseCase)
      : super(RecommendationInitial());

  final GetRecommendationUseCase getRecommendationUseCase;

  Future<void> fetchRecommendation(int id) async {
    emit(RecommendationInitial());

    Either<Failure, List<Recommendation>> response =
    await getRecommendationUseCase(RecommendationParameters(id: id));

    response.fold(
          (failure) => emit(
        const RecommendationFailure(
          recommendationMessage: 'can not fetch Recommendation Message',
        ),
      ),
          (recommendation) {
        emit(
          RecommendationLoaded(recommendation: recommendation),
        );
      },
    );
  }

}
