part of 'recommendation_tvs_cubit.dart';

sealed class RecommendationTVsState extends Equatable {
  const RecommendationTVsState();

  @override
  List<Object> get props => [];
}

final class RecommendationTVsInitial extends RecommendationTVsState {}

class RecommendationTVsLoaded extends RecommendationTVsState {
  final List<RecommendationTV> recommendation;
  const RecommendationTVsLoaded({required this.recommendation});

  @override
  List<Object> get props => [recommendation];
}

class RecommendationTVsFailure extends RecommendationTVsState {
  final String recommendationMessage;
  const RecommendationTVsFailure({required this.recommendationMessage});

  @override
  List<Object> get props => [recommendationMessage];
}
