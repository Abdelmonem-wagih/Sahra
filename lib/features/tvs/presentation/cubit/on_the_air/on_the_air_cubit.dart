import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sahar/core/exception/failure.dart';
import 'package:sahar/core/usecase/base_usecase.dart';
import 'package:sahar/features/tvs/domain/entities/tv.dart';
import 'package:sahar/features/tvs/domain/usecase/get_on_the_air_tv_usecase.dart';

part 'on_the_air_state.dart';

class OnTheAirCubit extends Cubit<OnTheAirState> {
  final GetOnTheAirUseCase getOnTheAirUseCase;
  OnTheAirCubit(this.getOnTheAirUseCase) : super(OnTheAirInitial());

  Future<void> fetchOnTheAir() async {
    emit(OnTheAirInitial());

    Either<Failure, List<TV>> response =
        await getOnTheAirUseCase(const NoParameters());

    response.fold(
      (failure) => emit(
        OnTheAirFailure(onTheAirMessage: 'can not fetch On The Air TVs'),
      ),
      (onTheAir) => emit(
        OnTheAirLoaded(onTheAir: onTheAir),
      ),
    );
  }
}
