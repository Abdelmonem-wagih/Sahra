import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/expend_cubit.dart';
import 'package:sahar/features/tvs/domain/entities/seasons.dart';
import 'package:sahar/features/tvs/presentation/cubit/episodes/episodes_cubit.dart';
import 'package:shimmer/shimmer.dart';

class OrderItem extends StatelessWidget {
  OrderItem({required this.seasons, required this.seriesId});
  final Seasons seasons;
  final int seriesId;
  @override
  Widget build(BuildContext context) {
    context.read<EpisodesCubit>().fetchEpisodes(
          seriesId: seriesId,
          seasonNumber: seasons.seasonNumber,
        );
    return BlocProvider(
      create: (context) => ExpandCubit(),
      child: BlocBuilder<ExpandCubit, bool>(
        builder: (context, expandState) {
          return Card(
            color: Colors.white10,
            child: Column(
              children: [
                ListTile(
                  title: Text('Season ${seasons.seasonNumber}'),
                  trailing: IconButton(
                    icon: Icon(
                        expandState ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      print(
                          'seasons.seasonNumber=====================> ${seasons.seasonNumber}==========================================================================');
                      print(
                          'seasons.seasonNumber=====================> ${seasons.seasonNumber}==========================================================================');

                      print(
                          'seasons.seasonNumber=====================> ${seasons.seasonNumber}==========================================================================');

                      context.read<ExpandCubit>().toggle();
                    },
                  ),
                ),
                if (expandState)
                  BlocBuilder<EpisodesCubit, EpisodesState>(
                    builder: (context, state) {
                      if (state is EpisodesInitial) {
                        print(
                            ' //////////////////////////////// EpisodesInitial //////////////////////////////// ');
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is EpisodesLoaded) {
                        return Container(
                          color: Colors.grey.shade900,
                          padding: EdgeInsets.symmetric(vertical: 4),
                          height: min(10 * 200.0 + 10, 500),
                          child: ListView.builder(
                            itemCount: state.episodes.length,
                            // replace with your actual item count
                            itemBuilder: (context, index) {
                              // replace this with your item widget
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          child: CachedNetworkImage(
                                            imageUrl: state.episodes[index]
                                                        .stillPath ==
                                                    null
                                                ? 'https://tarfehat.com/wp-content/uploads/2023/02/66.jpg'
                                                : AppConstance.imageUrl(state
                                                    .episodes[index]
                                                    .stillPath!),
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                              baseColor: Colors.grey[850]!,
                                              highlightColor: Colors.grey[800]!,
                                              child: Container(
                                                height: 90.0,
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                            height: 100.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListTile(
                                          title:
                                              Text(state.episodes[index].name!),
                                          subtitle: Text(
                                              state.episodes[index].airDate!),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.episodes[index].overview!,
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Error Loading Recommendations',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        );
                      }
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
