import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/core/unit/app_string.dart';
import 'package:sahar/features/tvs/domain/entities/genres_tv.dart';
import 'package:sahar/features/tvs/presentation/component/episodes_component.dart';
import 'package:sahar/features/tvs/presentation/component/recommendations_tvs_component.dart';
import 'package:sahar/features/tvs/presentation/cubit/tvs_details/tvs_details_cubit.dart';
import 'package:sahar/home_screen.dart';

class TVsDetailScreen extends StatelessWidget {
  final int id;

  const TVsDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TVsDetailsCubit>().fetchTVsDetails(id);
    return Scaffold(
      body: BlocBuilder<TVsDetailsCubit, TVsDetailsState>(
        builder: (context, state) {
          if (state is TVsDetailsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TVsDetailsLoaded) {
            final tvDetails = state.tvDetails;
            return DefaultTabController(
              length: 2,
              child: CustomScrollView(
                key: const Key('TvDetailScrollView'),
                slivers: [
                  SliverAppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                                  currentPageIndex: 1,
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
                              tvDetails.backdropPath!,
                            ),
                            fit: BoxFit.fill,
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
                              tvDetails.title!,
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
                                    tvDetails.releaseDate!.split('-')[0],
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
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
                                      (tvDetails.voteAverage! / 2)
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '(${tvDetails.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 1.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${tvDetails.numberOfSeasons} Seasons',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 16.0),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              tvDetails.overview!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${AppString.genres}: ${_showGenres(tvDetails.genres!)}',
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
                  SliverToBoxAdapter(
                    child: TabBar(
                      labelColor: Colors.white,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: const Color.fromARGB(
                                255, 230, 126, 126), // Color of the indicator
                            width: 3.0, // Thickness of the indicator
                          ),
                        ),
                      ),
                      tabs: [
                        Tab(text: ' EPISODES      '),
                        Tab(text: AppString.moreLikeThis),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      children: [
                        EpisodesComponent(
                          seriesId: tvDetails.id!,
                          seasonNumber: tvDetails.seasons![1].seasonNumber,
                          numberOfSeasons: tvDetails.numberOfSeasons!,
                          seasons: tvDetails.seasons!,
                        ),
                        RecommendationsTVsComponent(recommendationId: id),
                      ],
                    ),
                  ),
                ],
              ),
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

  String _showGenres(List<GenresTV> genres) {
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
