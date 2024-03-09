import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/usecase/get_popular_tvs_usecase.dart';

part 'popular_tvs_state.dart';

class PopularTVsCubit extends Cubit<PopularTVsState> {
  final GetPopularTVsUseCase getPopularTVsUseCase;
  PopularTVsCubit(this.getPopularTVsUseCase) : super(PopularTVsInitial());

  Future<void> fetchPopularTv() async {
    emit(PopularTVsInitial());

    Either<Failure, List<TV>> response =
        await getPopularTVsUseCase(const NoParameters());

    response.fold(
      (failure) => emit(
          PopularTVsFailure(popularTVsMessage: 'can not fetch Popular TVs')),
      (popular) => emit(
        PopularTVsLoaded(popularTVs: popular),
      ),
    );
  }
}
