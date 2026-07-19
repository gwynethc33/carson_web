import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:carson_web/widgets/responsive_scale.dart';

class VideoSection extends StatefulWidget {
  const VideoSection({super.key});

  @override
  State<VideoSection> createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController.fromVideoId(
      videoId: '4AOD6hrXL3c',
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final r = Responsive.scale(context);

    final videoWidth = viewportWidth < 600
        ? viewportWidth * 0.95
        : 750.0;

    return Container(
      width: double.infinity,
      color: const Color(0xFFD9D9D9),
      padding: EdgeInsets.symmetric(
        vertical: 70 * r,
        horizontal: Responsive.padding(context),
      ),
      child: Column(
        children: [
          Text(
            'You and me... forever',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: viewportWidth < 600 ? 48 : 56,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'typewriter',
            ),
          ),

          SizedBox(height: 35 * r),

          SizedBox(
            width: videoWidth,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: YoutubePlayer(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}