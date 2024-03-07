import 'package:sahar/features/tvs/domain/entities/episodes.dart';

class EpisodesModel extends Episodes {
  EpisodesModel({
    required super.episodeNumber,
    required super.airDate,
    required super.name,
    required super.overview,
    required super.stillPath,
  });

  factory EpisodesModel.fromJson(Map<String, dynamic> json) => EpisodesModel(
        episodeNumber: json['episode_number'],
        airDate: json['air_date'],
        name: json['name'],
        overview: json['overview'],
        stillPath: json['still_path'],
      );
}
