import 'package:sahar/features/tvs/domain/entities/seasons.dart';

class SeasonsModel extends Seasons {
  SeasonsModel({
    required super.id,
    required super.seasonNumber,
    required super.episodeCount,
    required super.airDate,
    required super.name,
  });

  factory SeasonsModel.fromJson(Map<String, dynamic> json) => SeasonsModel(
        id: json['id'],
        seasonNumber: json['season_number'],
        episodeCount: json['episode_count'],
        airDate: json['air_date'],
        name: json['name'],
      );
}
