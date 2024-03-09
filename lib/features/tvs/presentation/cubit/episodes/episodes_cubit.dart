import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/tvs/domain/entities/episodes.dart';
import 'package:sahar/features/tvs/domain/usecase/get_episodes_usecase.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final GetEpisodesUseCase getEpisodesUseCase;

  EpisodesCubit(this.getEpisodesUseCase) : super(EpisodesInitial());

  Future<void> fetchEpisodes(
      {required int seriesId, required int seasonNumber}) async {
    emit(EpisodesInitial());

    Either<Failure, List<Episodes>> response = await getEpisodesUseCase(
      EpisodesParameters(
        seriesId: seriesId,
        seasonNumber: seasonNumber,
      ),
    );
print('response =>>>>>>>>>>>>$response');
    response.fold(
      (failure) =>
          emit(EpisodesFailure(episodesMessage: 'can not fetch Episodes')),
      (episodes) => emit(
        EpisodesLoaded(episodes: episodes),
      ),
    );
  }
}
