import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/features/movies/presentation/cubit/movie_videos/movie_videos_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideosComponent extends StatelessWidget {
  const MovieVideosComponent({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
debugPrint(
              'state.movieVideos.last.videoKey=>>>>>>>>>>>>>>>>>>>>>>>>>>> $movieId');
    return BlocBuilder<MovieVideosCubit, MovieVideosState>(
      builder: (context, state) {
        if (state is MovieVideosInitial) {
          return const SliverPadding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is MovieVideosLoaded) {
          if (state.movieVideos.isEmpty) {
            return SliverPadding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Text('No videos available'),
                ),
              ),
            );
          }
          debugPrint(
              'state.movieVideos.last.videoKey=>>>>>>>>>>>>>>>>>>>>>>>>>>> ${state.movieVideos.last.videoKey!}');
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: state.movieVideos.last.videoKey!,
                  flags: YoutubePlayerFlags(
                    autoPlay: false,
                    mute: false,
                  ),
                ),
                showVideoProgressIndicator: true,
              ),
            ),
          );
        } else {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: const Text(
                  'Errrrrrrrrrrror Recommendation',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
