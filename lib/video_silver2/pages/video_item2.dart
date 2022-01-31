
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:silver_app_bar1/video_silver2/model/video_model_item2.dart';

class VideoItem2 extends StatefulWidget {

  final VideoModelItem2? videoListData;

  const VideoItem2({Key? key, required this.videoListData}) : super(key: key);
  @override
  _VideoItem2State createState() => _VideoItem2State();
}

class _VideoItem2State extends State<VideoItem2> {

  VideoModelItem2? get videoListData => widget.videoListData;
  BetterPlayerConfiguration? betterPlayerConfiguration;
  BetterPlayerListVideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = BetterPlayerListVideoPlayerController();
    betterPlayerConfiguration = BetterPlayerConfiguration(autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              videoListData!.videoTitle,
              style: TextStyle(fontSize: 50),
            ),
          ),
          AspectRatio(
              child: BetterPlayerListVideoPlayer(
                BetterPlayerDataSource(
                    BetterPlayerDataSourceType.network,
                    videoListData!.videoUrl,

                    notificationConfiguration: BetterPlayerNotificationConfiguration(
                        showNotification: false,
                        title: videoListData!.videoTitle,
                        author: "Test"),
                    bufferingConfiguration: BetterPlayerBufferingConfiguration(
                        minBufferMs: 2000,
                        maxBufferMs: 10000,
                        bufferForPlaybackMs: 1000,
                        bufferForPlaybackAfterRebufferMs: 2000),

                    placeholder: _buildVideoPlaceholder()
                ),
                configuration: BetterPlayerConfiguration(autoPlay: false, aspectRatio: 1, handleLifecycle: true),

                autoPlay: false,       // prevent playing automatically
                playFraction: 0.8,
                betterPlayerListVideoPlayerController: controller,
              ),
              aspectRatio:  1),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
                "Horror: In Steven Spielberg's Jaws, a shark terrorizes a beach "
                "town. Plainspoken sheriff Roy Scheider, hippie shark "
                "researcher Richard Dreyfuss, and a squirrely boat captain "
                "set out to find the beast, but will they escape with their "
                "lives? 70's special effects, legendary score, and trademark "
                "humor set this classic apart."),
          ),
          Center(
            child: Wrap(children: [
              ElevatedButton(
                child: Text("Play"),
                onPressed: () {
                  controller!.play();
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: Text("Pause"),
                onPressed: () {
                  controller!.pause();
                },
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                child: Text("Set max volume"),
                onPressed: () {
                  controller!.setVolume(100);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlaceholder() {
    return Image.network("https://webkit.org/demos/srcset/image-src.png" , fit: BoxFit.cover);
  }
}
