import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:silver_app_bar1/video_silver2/model/video_model_item2.dart';
import 'package:silver_app_bar1/video_silver2/pages/video_item2.dart';
import 'package:silver_app_bar1/video_silver2/repository2/video_repository2.dart';

class VideoList2 extends StatefulWidget {
  @override
  _VideoList2State createState() => _VideoList2State();
}

class _VideoList2State extends State<VideoList2> {
  late BetterPlayerController betterPlayerController;

  int indexPlayer = -1;

  // pagination
  static const _pageSize = 3;
  final PagingController<int, VideoModelItem2> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    betterPlayerController =
        BetterPlayerController(BetterPlayerConfiguration());

    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final model = await VideoRepository2().fetchVideoList(pageKey, _pageSize);
      final newItems = model.videoList2;

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
              PagedListView<int, VideoModelItem2>.separated(
                // physics:  AlwaysScrollableScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<VideoModelItem2>(
                  animateTransitions: true,

                  firstPageProgressIndicatorBuilder: (_) => firstPageIndicator(context),
                  newPageProgressIndicatorBuilder: (_) => NewItemIndicator(context),
                  noMoreItemsIndicatorBuilder: (_) => NoMoreItemIndicator(context),
                  noItemsFoundIndicatorBuilder: (_) => noFirstItemsFoundIndicator(context) ,

                  itemBuilder: (context, videoListData, index) => VideoItem2(
                    videoListData: videoListData,
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

  Widget NewItemIndicator(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10),
      color: Colors.redAccent,
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            " ...در حال دریافت",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          )),
    );
  }

  Widget NoMoreItemIndicator(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(right: 10),
      color: Colors.redAccent,
      child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "!آیتم بیشتری برای نمایش وجود ندارد",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.right,
          )),
    );
  }

  Widget firstPageIndicator(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.pink,
    ));
  }

  Widget  noFirstItemsFoundIndicator(BuildContext context) {
    return Center(
        child: Text("آیتمی برای نمایش وجود ندارد" ,style: TextStyle(color: Colors.pink),)

    );
  }


}
