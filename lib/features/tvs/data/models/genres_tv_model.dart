import 'package:sahar/features/tvs/domain/entities/genres_tv.dart';

class GenresTVsModel extends GenresTV {
  const GenresTVsModel({
    required super.name,
    required super.id,
  });
  factory GenresTVsModel.fromJson(Map<String, dynamic> json) => GenresTVsModel(
        name: json["name"],
        id: json["id"],
      );
}
