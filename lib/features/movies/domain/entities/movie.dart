import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final String backdropPath;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.backdropPath,
    required this.releaseDate,
  });

  //we use equatable because if we have a lot of object
  // from the same class with the same data there sorted in the same id
  @override
  List<Object> get props =>
      [id, title, overview, genreIds, voteAverage, backdropPath, releaseDate];
}
