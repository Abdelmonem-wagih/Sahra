part of 'episodes_cubit.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

 class EpisodesInitial extends EpisodesState {}

class EpisodesLoaded extends EpisodesState {
  final List<Episodes> episodes;
  const EpisodesLoaded({required this.episodes});

  @override
  List<Object> get props => [episodes];
}

class EpisodesFailure extends EpisodesState {
  final String episodesMessage;
  const EpisodesFailure({required this.episodesMessage});

  @override
  List<Object> get props => [episodesMessage];
}
