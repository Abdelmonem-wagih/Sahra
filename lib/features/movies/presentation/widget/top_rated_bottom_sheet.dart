import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/movies/presentation/cubit/toprated_movies/top_rated_movies_cubit.dart';
import 'package:sahar/features/movies/presentation/screens/movie_detail_screen.dart';

import 'package:shimmer/shimmer.dart';

class TopRatedBottomSheet extends StatelessWidget {
  const TopRatedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
      builder: (context, state) {
        if (state is TopRatedMoviesInitial) {
          return const SizedBox(
            height: 170.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TopRatedMoviesLoaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const SizedBox(width: 50),
                    const Text(
                      'Top Rated Movies',
                      style: TextStyle(fontSize: 25),
                    )
                  ],

                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    itemCount: state.topRatedMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.topRatedMovies[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          color: Colors.grey.shade800,
                        ),
                        margin: const EdgeInsets.only(bottom: 8.0),
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailScreen(id: movie.id),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  width: 110.0,
                                  height: 170,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                  AppConstance.imageUrl(movie.backdropPath),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey[850]!,
                                        highlightColor: Colors.grey[800]!,
                                        child: Container(
                                          height: 170.0,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                  errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.0,
                                            horizontal: 5.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 230, 126, 126),
                                            borderRadius:
                                            BorderRadius.circular(4.0),
                                          ),
                                          child: Text(
                                            movie.releaseDate.split('-')[0],
                                            style: const TextStyle(
                                              fontSize: 13.0,
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
                                              size: 17.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              (movie.voteAverage / 2)
                                                  .toStringAsFixed(1),
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15.0),
                                    Text(
                                      movie.overview,
                                      maxLines: 4,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 170.0,
            child: Center(
              child: Text('can not catch Popular Movies'),
            ),
          );
        }
      },
    );
  }
}
