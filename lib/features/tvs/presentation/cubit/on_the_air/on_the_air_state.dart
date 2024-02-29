part of 'on_the_air_cubit.dart';

abstract class OnTheAirState extends Equatable {
  const OnTheAirState();

  @override
  List<Object> get props => [];
}

class OnTheAirInitial extends OnTheAirState {}

class OnTheAirLoaded extends OnTheAirState {
  final List<TV> onTheAir;
  const OnTheAirLoaded({required this.onTheAir});

  @override
  List<Object> get props => [onTheAir];
}

class OnTheAirFailure extends OnTheAirState {

  final String onTheAirMessage;
  const OnTheAirFailure({required this.onTheAirMessage});

  @override
  List<Object> get props => [onTheAirMessage];
}
