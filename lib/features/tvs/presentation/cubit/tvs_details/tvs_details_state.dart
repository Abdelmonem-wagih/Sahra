part of 'tvs_details_cubit.dart';

abstract class TVsDetailsState extends Equatable {
  const TVsDetailsState();

  @override
  List<Object> get props => [];
}

class TVsDetailsInitial extends TVsDetailsState {}

class TVsDetailsLoaded extends TVsDetailsState {
  final TVsDetail tvDetails;
  const TVsDetailsLoaded({required this.tvDetails});

  @override
  List<Object> get props => [tvDetails];
}

class TVsDetailsFailure extends TVsDetailsState {
  final String tvDetailsMessage;
  const TVsDetailsFailure({required this.tvDetailsMessage});

  @override
  List<Object> get props => [tvDetailsMessage];
}
