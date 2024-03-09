import 'package:equatable/equatable.dart';

class MovieVideos extends Equatable{
final String? videoKey;

  MovieVideos({required this.videoKey});
  
  @override
  List<Object?> get props => [videoKey];

}