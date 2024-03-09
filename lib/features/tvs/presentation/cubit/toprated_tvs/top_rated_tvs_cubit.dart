import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/usecase/get_toprated_tvs_usecase.dart';

part 'top_rated_tvs_state.dart';

class TopRatedTVsCubit extends Cubit<TopRatedTVsState> {
  final GetTopRatedTVsUseCase getTopRatedTVsUseCase;
  TopRatedTVsCubit(this.getTopRatedTVsUseCase) : super(TopRatedTVsInitial());

  Future<void> fetchTopRatedTV() async {
    emit(TopRatedTVsInitial());

    Either<Failure, List<TV>> response =
        await getTopRatedTVsUseCase(const NoParameters());

    response.fold(
      (failure) => emit(
        TopRatedTVsFailure(topRatedTVsMessage: 'can not fetch Top Rated TVs'),
      ),
      (topRated) => emit(
        TopRatedTVsLoaded(topRatedTVs: topRated),
      ),
    );
  }
}
