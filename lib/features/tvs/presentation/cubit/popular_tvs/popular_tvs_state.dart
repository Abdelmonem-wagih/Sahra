part of 'popular_tvs_cubit.dart';

abstract class PopularTVsState extends Equatable {
  const PopularTVsState();

  @override
  List<Object> get props => [];
}

class PopularTVsInitial extends PopularTVsState {}

class PopularTVsLoaded extends PopularTVsState {
  final List<TV> popularTVs;
  const PopularTVsLoaded({required this.popularTVs});

  @override
  List<Object> get props => [popularTVs];
}

class PopularTVsFailure extends PopularTVsState {
  final String popularTVsMessage;
  const PopularTVsFailure({required this.popularTVsMessage});

  @override
  List<Object> get props => [popularTVsMessage];
}
