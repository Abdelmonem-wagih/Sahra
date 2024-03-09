part of 'now_playing_movies_cubit.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final List<Movie> nowPlayingMovies;

  const NowPlayingLoaded({required this.nowPlayingMovies});
  @override
  List<Object> get props => [nowPlayingMovies];
}

class NowPlayingfailure extends NowPlayingState {
  final String nowPlayingMessage;

  const NowPlayingfailure({
    required this.nowPlayingMessage,
  });

  @override
  List<Object> get props => [nowPlayingMessage];
}
