import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahar/features/tvs/domain/entities/seasons.dart';
import 'package:sahar/features/tvs/presentation/cubit/episodes/episodes_cubit.dart';
import 'package:sahar/order_widget.dart';

class EpisodesComponent extends StatelessWidget {
  const EpisodesComponent({
    Key? key,
    required this.seriesId,
    required this.seasonNumber,
    required this.numberOfSeasons,
    required this.seasons,
  }) : super(key: key);

  final int seriesId;
  final int seasonNumber;
  final int numberOfSeasons;
  final List<Seasons> seasons;

  @override
  Widget build(BuildContext context) {
    print(
        ' seriesId =>>>>>>>>>>>>>>>> $seriesId /////////////////// seasonNumber =>>>>>>>>>>>>>>>>>>> $seasonNumber');


   
          return ListView.builder(
            itemCount: numberOfSeasons,
            itemBuilder: (context, index1) {
              return OrderItem(
                seasons: seasons[index1],
                seriesId: seriesId,
              );
            },
          );
       
      
    
  }
}
