import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit() : super(EpisodesInitial());
}
