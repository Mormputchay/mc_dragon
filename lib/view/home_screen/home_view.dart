import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final videoURL = "https://www.youtube.com/watch?v=eQYQHUvSUwg";
  late YoutubePlayerController controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
        ));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Transform.scale(
              scale: controller.value.isFullScreen ? 1 : 1,
              child: YoutubePlayer(
                controller: controller,
                aspectRatio: 15 / 9,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.pink,
                progressColors: const ProgressBarColors(
                    playedColor: Colors.pink, handleColor: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
