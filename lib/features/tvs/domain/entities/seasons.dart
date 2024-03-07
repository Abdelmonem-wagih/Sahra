import 'package:equatable/equatable.dart';

class Seasons extends Equatable {
  final int id;
  final int seasonNumber;
  final int? episodeCount;
  final String? airDate;
  final String? name;

  Seasons({
    required this.name,
    required this.id,
    required this.seasonNumber,
    required this.episodeCount,
    required this.airDate,
  });

  @override
  List<Object?> get props => [
        id,
        seasonNumber,
        episodeCount,
        airDate,
        name,
      ];
}
