
import 'package:sahar/features/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json["backdrop_path"] ?? '/4woSOUD0equAYzvwhWBHIJDCM88.jpg',
        id: json["id"],
      );
}
