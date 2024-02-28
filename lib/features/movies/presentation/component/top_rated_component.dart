import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/movies/presentation/cubit/toprated_movies/top_rated_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';


class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TopRatedMoviesCubit>().fetchTopRatedMovies();
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesInitial) {
          return const SizedBox(
            height: 170,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TopRatedMoviesLoaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(id: movie.id),
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
