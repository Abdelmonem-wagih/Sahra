import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/tvs/presentation/screens/tv_detail_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

import '../cubit/toprated_tvs/top_rated_tvs_cubit.dart';


class TopRatedTVsComponent extends StatelessWidget {
  const TopRatedTVsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TopRatedTVsCubit>().fetchTopRatedTV();
    return BlocBuilder<TopRatedTVsCubit, TopRatedTVsState>(
      builder: (context, state) {
        if (state is TopRatedTVsInitial) {
          return const SizedBox(
            height: 170,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TopRatedTVsLoaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedTVs.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedTVs[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TVsDetailScreen(id: movie.id),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: AppConstance.imageUrl(movie.backdropPath),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error)),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 170,
            child: Center(
              child: Text('can not catch Top Rated Movies'),
            ),
          );
        }
      },
    );
  }
}
