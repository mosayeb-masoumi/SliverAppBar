import 'dart:math' as math;

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/model/user_model.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/pages/user_item.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/repository/my_repository.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/model/video_model.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/pages/video_item.dart';
import 'package:silver_app_bar1/video_tabbar_silver_appbar/repository/video_repository.dart';

class VideoList extends StatefulWidget {
  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {


  late BetterPlayerController betterPlayerController ;
  int indexPlayer = -1;


  // pagination
  static const _pageSize = 8;
  final PagingController<int, VideoModel> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {

    betterPlayerController = BetterPlayerController(BetterPlayerConfiguration());

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final model = await VideoRepository().fetchVideoList(pageKey, _pageSize);
      final newItems = model.videoList;

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                // collapsedHeight: 100,
                toolbarHeight: 50,
                backgroundColor: Colors.blueGrey,
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                // to remove back button

                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,

                  background: Container(
                    color: Colors.grey,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("مسیب معصومی"),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 20),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png"),
                                          fit: BoxFit.cover),
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text("hdsfhuihkjhsdflkhaiuwerfi8wqeyhifhasifdhl")
                          ],
                        ),

                      ],


                    ),
                  ),

                 //Images.network
                ),

                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Container(
                    color: Colors.blueGrey,
                    child: TabBar(
                      indicatorColor: Colors.yellow,
                      labelColor: Colors.yellow,
                      unselectedLabelColor: Colors.red,
                      tabs: [
                        Tab(text: "Call"),
                        Tab(text: "Message"),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },


          body: TabBarView(
            children: [
              //first tab
              PagedListView<int, VideoModel>.separated(

                // physics:  AlwaysScrollableScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),

                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<VideoModel>(
                  animateTransitions: true,
                  itemBuilder: (context, videoModelItem, index) =>
                      // VideoItem(videoModelItem: videoModelItem, index: index),
                      GestureDetector(
                          child: VideoItem(canbuild: indexPlayer == index ? true : false,betterPlayerController: betterPlayerController,videoModelItem: videoModelItem, index: index),

                        onTap: (){
                          // if(indexPlayer==-1||(betterPlayerController.isVideoInitialized()??false) ){
                            setState(() {
                                indexPlayer = index;
                                _freeController();
                                _setupController(videoModelItem);
                            });
                          // };
                        },
                      ),


                ),
                separatorBuilder: (context, index) => const Divider(),
              ),





              // second tab
              Container(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Text("Item $index");
                      })),
            ],
          ),
        ),
      ),
    );
  }










  void _freeController() {
    if (betterPlayerController != null) {
      betterPlayerController.pause();
      betterPlayerController.dispose();
      //  _initialized = false;
    }
  }

  void _setupController(VideoModel videoModel) {
    BetterPlayerConfiguration betterPlayerConfiguration =
    BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoDispose: false,
        autoPlay: true,
        showPlaceholderUntilPlay: true,
        looping: false,

        controlsConfiguration: BetterPlayerControlsConfiguration(
            controlBarColor: Colors.black.withAlpha(600),
            controlBarHeight: 30,
            overflowModalColor: Colors.yellow,
            overflowModalTextColor: Colors.white,
            overflowMenuIconsColor: Colors.white,
            enableSkips: false,
            // playIcon: const AssetImage("assets/images/play_icon.png"),


            enablePlayPause: false
        ));
    BetterPlayerDataSource? _betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, videoModel.videoUrl,
        placeholder: _buildVideoPlaceholder(videoModel.cover),

        cacheConfiguration: const BetterPlayerCacheConfiguration(useCache: false));

    betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    betterPlayerController.setupDataSource(_betterPlayerDataSource);


    // betterPlayerController.addEventsListener((event) {
      /*   print("***********************************"+betterPlayerController.betterPlayerAsmsTrack!.height.toString());

      print("Better player event: ${event.betterPlayerEventType}");
*/
      // if (event.betterPlayerEventType == BetterPlayerEventType.play) {
      //   _setPlaceholderVisibleState(false);
      // }


      // if (event.betterPlayerEventType == BetterPlayerEventType.openFullscreen) {
      //   var weight = MediaQuery.of(context).size.width;
      //   var height = (weight * 9) / 16;
      //   _scrollController.animateTo(
      //     (height + 95) * indexPlayer + 40 * (indexPlayer)+10,
      //     duration: Duration(milliseconds: 100),
      //     curve: Curves.fastOutSlowIn,
      //   );
      // }
    // });

  }

  Widget _buildVideoPlaceholder(String cover) {
    return Image.network(cover , fit: BoxFit.cover);
  }



  @override
  void dispose() {
    _freeController();
    super.dispose();
  }

}
