part of 'episodes_cubit.dart';

sealed class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

final class EpisodesInitial extends EpisodesState {}
