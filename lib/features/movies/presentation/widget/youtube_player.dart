

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoId;

  const VideoPlayerWidget({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
    );
  }
}


class NewsDetailPage extends StatelessWidget {
  final String videoId;

  const NewsDetailPage({Key? key, required this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: Column(
        children: [
          // Other news details/widgets
          VideoPlayerWidget(videoId: videoId),
        ],
      ),
    );
  }
}
