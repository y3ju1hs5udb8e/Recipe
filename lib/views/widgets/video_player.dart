import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VideoPlayer extends StatefulWidget {
  final String link;
  const VideoPlayer({super.key, required this.link});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom:
          PlayVideoFrom.youtube('https://www.youtube.com/embed/${widget.link}'),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        isLooping: false,
        videoQualityPriority: [720, 360],
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}
