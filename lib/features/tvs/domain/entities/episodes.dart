import 'package:equatable/equatable.dart';

class Episodes extends Equatable {
  final int? episodeNumber;
  final String? airDate;
  final String? name;
  final String? overview;
  final String? stillPath;

  Episodes({
    required this.episodeNumber,
    required this.airDate,
    required this.name,
    required this.overview,
    required this.stillPath,
  });

  @override
  List<Object?> get props => [
        episodeNumber,
        airDate,
        name,
        overview,
        stillPath,
      ];
}
