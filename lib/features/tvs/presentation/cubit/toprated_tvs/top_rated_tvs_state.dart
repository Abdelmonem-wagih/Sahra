part of 'top_rated_tvs_cubit.dart';

abstract class TopRatedTVsState extends Equatable {
  const TopRatedTVsState();

  @override
  List<Object> get props => [];
}

class TopRatedTVsInitial extends TopRatedTVsState {}

class TopRatedTVsLoaded extends TopRatedTVsState {
  final List<TV> topRatedTVs;
  const TopRatedTVsLoaded({required this.topRatedTVs});

  @override
  List<Object> get props => [topRatedTVs];
}

class TopRatedTVsFailure extends TopRatedTVsState {
  final String topRatedTVsMessage;
  const TopRatedTVsFailure({required this.topRatedTVsMessage});

  @override
  List<Object> get props => [topRatedTVsMessage];
}
