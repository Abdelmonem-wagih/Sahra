
import 'package:sahar/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.backdropPath,
    required super.releaseDate,
  });

  //to return data from Json File
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["title"],
    overview: json["overview"],
    genreIds: List<int>.from(
        json["genre_ids"].map((e) => e)), //to return List from db
    voteAverage: json["vote_average"].toDouble(),
    backdropPath: json["backdrop_path"],
    releaseDate: json["release_date"],
  );
}
