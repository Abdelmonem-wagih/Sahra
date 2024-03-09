import 'package:sahar/features/tvs/data/models/genres_tv_model.dart';
import 'package:sahar/features/tvs/data/models/seasons_model.dart';
import 'package:sahar/features/tvs/domain/entities/tv_details.dart';

class TVsDetailsModel extends TVsDetail {
  const TVsDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.numberOfSeasons,
    required super.seasons,
  });

  factory TVsDetailsModel.fromJson(Map<String, dynamic> json) =>
      TVsDetailsModel(
        backdropPath:
            json["backdrop_path"] ?? '/y4w232QOzDD1McRocp2htMVmF3b.jpg',
        genres: List<GenresTVsModel>.from(
          json["genres"].map(
            (x) => GenresTVsModel.fromJson(x),
          ),
        ),
        id: json["id"],
        overview: json["overview"],
        releaseDate: json["first_air_date"],
        title: json["name"],
        voteAverage: json["vote_average"].toDouble(),
        numberOfSeasons: json['number_of_seasons'],
        seasons: List<SeasonsModel>.from(
          json['seasons'].map(
            (x) => SeasonsModel.fromJson(x),
          ),
        ),
      );
}
