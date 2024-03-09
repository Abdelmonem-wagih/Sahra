import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:sahar/core/unit/app_string.dart';

import 'package:sahar/features/tvs/presentation/component/on_the_air_component.dart';
import 'package:sahar/features/tvs/presentation/component/popular_tvs_component.dart';
import 'package:sahar/features/tvs/presentation/component/top_rated_tv_component.dart';
import 'package:sahar/features/tvs/presentation/widget/popular_tvs_bottom_sheet.dart';
import 'package:sahar/features/tvs/presentation/widget/top_rated_tvs_bottom_sheet.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SingleChildScrollView(
        key: const Key('View'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const OnTheAirComponent(),
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
                   // onTap: () => showSheet(true),
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
            const PopularTVsComponent(),
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
                  const Text(
                    AppString.topRated,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    //onTap: () => showSheet(false),
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
            const TopRatedTVsComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
