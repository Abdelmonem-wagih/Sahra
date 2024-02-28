import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:sahar/core/unit/app_string.dart';
import 'package:sahar/features/movies/presentation/component/now_playing_component.dart';
import 'package:sahar/features/movies/presentation/component/popular_component.dart';
import 'package:sahar/features/movies/presentation/component/top_rated_component.dart';
import 'package:sahar/features/movies/presentation/widget/popular_bottom_sheet.dart';
import 'package:sahar/features/movies/presentation/widget/top_rated_bottom_sheet.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showSheet(bool popularMovie) {
      showFlexibleBottomSheet<void>(
        minHeight: 0,
        initHeight: 0.97,
        maxHeight: 1,
        context: context,
        isSafeArea: true,
        bottomSheetColor: Colors.transparent,
        builder: (context, controller, offset) {
          return popularMovie
              ? const PopularBottomSheet()
              : const TopRatedBottomSheet();
        },
        anchors: [0, 0.5, 1],
        useRootScaffold: false,
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    AppString.popular,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () => showSheet(true),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            AppString.seeMore,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(AppString.topRated,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          letterSpacing: 0.15)),
                  InkWell(
                    onTap: () => showSheet(false),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            AppString.seeMore,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            color: Colors.white,
                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
