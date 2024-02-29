import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/features/tvs/domain/entities/tv_details.dart';
import 'package:sahar/features/tvs/domain/usecase/get_tv_details_usecase.dart';

part 'tvs_details_state.dart';

class TVsDetailsCubit extends Cubit<TVsDetailsState> {
  final GetTVsDetailsUseCase getTVsDetailsUseCase;
  TVsDetailsCubit(this.getTVsDetailsUseCase) : super(TVsDetailsInitial());

  Future<void> fetchTVsDetails(int seriesId) async {
    emit(TVsDetailsInitial());

    Either<Failure, TVsDetail> response =
        await getTVsDetailsUseCase(TVsDetailsParameter(seriesId: seriesId));

    response.fold(
      (failure) => emit(
        TVsDetailsFailure(tvDetailsMessage: 'can not fetch TVs Details'),
      ),
      (tvDetails) => emit(
        TVsDetailsLoaded(tvDetails: tvDetails),
      ),
    );
  }
}
