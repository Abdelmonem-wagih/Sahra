import 'package:sahar/features/tvs/domain/entities/recommendation.dart';

class RecommendationTVsModel extends RecommendationTV {
  RecommendationTVsModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationTVsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationTVsModel(
        backdropPath: json["backdrop_path"] ?? '/y4w232QOzDD1McRocp2htMVmF3b.jpg',
        id: json['id'],
      );
}
