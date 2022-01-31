
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/model/video_model.dart';

class VideoItem extends StatefulWidget {


  BetterPlayerController betterPlayerController;
  bool canbuild;
  VideoModel videoModelItem;
  int index;
  VideoItem({Key? key , required this.betterPlayerController, required this.canbuild ,required this.videoModelItem , required this.index }) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {

  VideoModel? get videoModelItem => widget.videoModelItem;

  // BetterPlayerController get betterPlayerController => widget.betterPlayerController;
  BetterPlayerController get betterPlayerController => widget.betterPlayerController;


  bool showVideo = false;

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


          widget.canbuild ? AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(
                controller: betterPlayerController,
                //     controller: controller!,
              ))
              : AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: Stack(fit: StackFit.expand, children: [
                CachedNetworkImage(
                  imageUrl: videoModelItem!.cover,
                  fit: BoxFit.fill,
                ),
                Center(
                  // child: SvgPicture.asset(
                  //   "assets/images/play_icon.svg",
                  // ),
                  child: Image.asset("assets/images/play_button.png" ,height: 50,width: 60,),



                )
              ]),
            ),
          ),

        ],
      ),
    );
  }
}
