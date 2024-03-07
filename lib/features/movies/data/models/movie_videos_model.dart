import 'package:sahar/features/movies/domain/entities/movie_videos.dart';

class MovieVideosModel extends MovieVideos {
  MovieVideosModel({required super.videoKey});

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) =>
      MovieVideosModel(
        videoKey: json['key'],
      );
}
