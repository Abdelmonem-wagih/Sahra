part of 'recommendation_cubit.dart';

abstract class RecommendationState extends Equatable {
  const RecommendationState();

  @override
  List<Object> get props => [];
}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<Recommendation> recommendation;

  const RecommendationLoaded({required this.recommendation});

  @override
  List<Object> get props => [recommendation];
}

class RecommendationFailure extends RecommendationState {
  final String recommendationMessage;

  const RecommendationFailure({required this.recommendationMessage});

  @override
  List<Object> get props => [recommendationMessage];
}
