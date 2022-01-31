
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/model/video_model.dart';

class VideoItem2 extends StatefulWidget {


  VideoModel videoModelItem;
  BetterPlayerController betterPlayerController;
  int index;

  bool showVideo;

  VideoItem2({Key? key , required this.videoModelItem, required this.betterPlayerController, required this.index , required this.showVideo , }) : super(key: key);

  @override
  _VideoItem2State createState() => _VideoItem2State();
}

class _VideoItem2State extends State<VideoItem2> {

  VideoModel? get videoModelItem => widget.videoModelItem;
  BetterPlayerController get betterPlayerController => widget.betterPlayerController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Stack(
        children: [

          widget.showVideo == true? AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              controller: betterPlayerController,
            ),
          ): AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: Stack(fit: StackFit.expand, children: [
                CachedNetworkImage(
                  imageUrl: videoModelItem!.cover,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Image.asset("assets/images/play_button.png" ,height: 50,width: 60,),
                )
              ]),
            ),
          ),

          // widget.canbuild ? AspectRatio(
          //     aspectRatio: 16 / 9,
          //     child: BetterPlayer(
          //       controller: betterPlayerController,
          //       //     controller: controller!,
          //     ))
          //     : AspectRatio(
          //   aspectRatio: 16 / 9,
          //   child: Container(
          //     color: Colors.black,
          //     child: Stack(fit: StackFit.expand, children: [
          //       CachedNetworkImage(
          //         imageUrl: videoModelItem!.cover,
          //         fit: BoxFit.fill,
          //       ),
          //       Center(
          //         // child: SvgPicture.asset(
          //         //   "assets/images/play_icon.svg",
          //         // ),
          //         child: Image.asset("assets/images/play_button.png" ,height: 50,width: 60,),
          //
          //
          //
          //       )
          //     ]),
          //   ),
          // ),

        ],
      ),
    );
  }


}
