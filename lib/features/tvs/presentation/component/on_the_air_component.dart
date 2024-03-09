import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:sahar/core/unit/app_constance.dart';
import 'package:sahar/features/tvs/presentation/cubit/on_the_air/on_the_air_cubit.dart';
import 'package:sahar/features/tvs/presentation/screens/tv_detail_screen.dart';

class OnTheAirComponent extends StatelessWidget {
  const OnTheAirComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnTheAirCubit, OnTheAirState>(
      builder: (context, state) {
        if (state is OnTheAirInitial) {
          return const SizedBox(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is OnTheAirLoaded) {
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: state.onTheAir.map(
                    (item) {
                  return GestureDetector(
                    key: const Key('onTheAir'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TVsDetailScreen(id: item.id),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: AppConstance.imageUrl(item.backdropPath),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'On The Air'.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
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
    );
  }
}
