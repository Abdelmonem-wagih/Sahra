import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/tvs/presentation/screens/tv_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/recommendation_tvs/recommendation_tvs_cubit.dart';

class RecommendationsTVsComponent extends StatelessWidget {
  const RecommendationsTVsComponent({super.key, required this.recommendationId});
  final int recommendationId;
  @override
  Widget build(BuildContext context) {
    context.read<RecommendationTVsCubit>().fetchRecommendationTV(recommendationId);

    return BlocBuilder<RecommendationTVsCubit, RecommendationTVsState>(
      builder: (context, state) {
        if (state is RecommendationTVsInitial) {
          return const SliverPadding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else if (state is RecommendationTVsLoaded) {
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: state.recommendation.length,
                    (context, index) {
                  final recommendation = state.recommendation[index];
                  return FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TVsDetailScreen(id: recommendation.id),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(4.0)),
                        child: CachedNetworkImage(
                          imageUrl: AppConstance.imageUrl(
                              recommendation.backdropPath!),
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
                          const Icon(Icons.error),
                          height: 180.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                // childCount: recommendationDummy.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
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
