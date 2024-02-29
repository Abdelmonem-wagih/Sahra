import 'package:sahar/features/tvs/domain/entities/tv.dart';

class TVsModel extends TV {
  TVsModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.backdropPath,
    required super.releaseDate,
  });

  factory TVsModel.fromJson(Map<String, dynamic> json) => TVsModel(
        id: json["id"],
        title: json["name"],
        overview: json["overview"]?? 'googogogo',
        genreIds: List<int>.from(
            json["genre_ids"].map((e) => e)), //to return List from db
        voteAverage: json["vote_average"].toDouble(),
        backdropPath: json["backdrop_path"]?? '/y4w232QOzDD1McRocp2htMVmF3b.jpg',
        releaseDate: json["first_air_date"],
      );
}
