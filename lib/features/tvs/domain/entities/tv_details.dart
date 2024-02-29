// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:sahar/features/tvs/domain/entities/genres_tv.dart';
import 'package:sahar/features/tvs/domain/entities/seasons.dart';

class TVsDetail extends Equatable {
  final String? backdropPath;
  final List<GenresTV>? genres;
  final int? id;
  final String? overview;
  final String? releaseDate;
  final int? numberOfSeasons;
  final String? title;
  final double? voteAverage;
  final List<Seasons>? seasons;

  const TVsDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.numberOfSeasons,
    required this.title,
    required this.voteAverage,
    required this.seasons,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        releaseDate,
        numberOfSeasons,
        title,
        voteAverage,
        seasons,
      ];
}
