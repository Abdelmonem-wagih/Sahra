import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/core/unit/app_string.dart';
import 'package:sahar/features/movies/presentation/component/movie_videos_component.dart';
import 'package:sahar/features/movies/presentation/component/recommendations_component.dart';
import 'package:sahar/features/movies/presentation/cubit/movie_details/movies_details_cubit.dart';
import 'package:sahar/home_screen.dart';
import '../../domain/entities/genres.dart';
import '../cubit/movie_videos/movie_videos_cubit.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MoviesDetailsCubit>().fetchMoviesDetails(id);
    context.read<MovieVideosCubit>().getMovieVideos(id);

    return Scaffold(
      body: BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
        builder: (context, state) {
          if (state is MoviesDetailsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesDetailsLoaded) {
            return CustomScrollView(
              key: const Key('movieDetailScrollView'),
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                currentPageIndex: 0,
                              )),
                    ),
                  ),
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                            stops: [0.0, 0.5, 1.0, 1.0],
                          ).createShader(
                            Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                          );
                        },
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          imageUrl: AppConstance.imageUrl(
                            state.movieDetail.backdropPath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.movieDetail.title,
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white38,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(
                                  state.movieDetail.releaseDate.split('-')[0],
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    (state.movieDetail.voteAverage / 2)
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Text(
                                    '(${state.movieDetail.voteAverage})',
                                    style: const TextStyle(
                                      fontSize: 1.0,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16.0),
                              Text(
                                _showDuration(state.movieDetail.runtime),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.movieDetail.overview,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            '${AppString.genres}: ${_showGenres(state.movieDetail.genres)}',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        'Tailler',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // Tab(text: 'More like this'.toUpperCase()),
                MovieVideosComponent(
                  movieId: id,
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  sliver: SliverToBoxAdapter(
                    child: FadeInUp(
                      from: 20,
                      duration: const Duration(milliseconds: 500),
                      child: const Text(
                        AppString.moreLikeThis,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                // SliverToBoxAdapter(
                //   child: TabBar(
                //     labelColor: Colors.white,
                //     dividerColor: Colors.transparent,
                //     indicatorSize: TabBarIndicatorSize.tab,
                //     indicator: BoxDecoration(
                //       border: Border(
                //         bottom: BorderSide(
                //           color: const Color.fromARGB(
                //               255, 230, 126, 126), // Color of the indicator
                //           width: 3.0, // Thickness of the indicator
                //         ),
                //       ),
                //     ),
                //     tabs: [
                //       Tab(text: ' EPISODES      '),
                //       Tab(text: AppString.moreLikeThis),
                //     ],
                //   ),
                // ),
              RecommendationsComponent(recommendationId: id),
                
                // SliverFillRemaining(
                //   child: TabBarView(
                //     children: [
                //       RecommendationsComponent(recommendationId: id),
                //       RecommendationsComponent(recommendationId: id),
                //     ],
                //   ),
                // ),
              ],
            );
          } else {
            return const SizedBox(
              height: 400.0,
              child: Center(
                child: Text('cant catch Now Playing Movies'),
              ),
            );
          }
        },
      ),
    );
  }

  String _showGenres(List<Genres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
