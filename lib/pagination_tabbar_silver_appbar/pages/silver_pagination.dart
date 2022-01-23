import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:silver_app_bar1/model.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/model/user_model.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/pages/user_item.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/repository/my_repository.dart';

class SilverPagination extends StatefulWidget {
  @override
  _SilverPaginationState createState() => _SilverPaginationState();
}

class _SilverPaginationState extends State<SilverPagination> {
  // List<ModelInfo> list = [];
  //
  // bool showGridList = false;

  // @override
  // void initState() {
  //   initialList();
  //   super.initState();
  // }
  //
  // void initialList() {
  //   list.add(ModelInfo("ali", "rezai"));
  //   list.add(ModelInfo("milad", "moradi"));
  //   list.add(ModelInfo("mina", "akbari"));
  //   list.add(ModelInfo("fiza", "leonardo"));

  // pagination
  static const _pageSize = 8;
  final PagingController<int, UserModel> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final model = await MyRepository().fetchPalyListName(pageKey, _pageSize);
      final newItems = model.userList;

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

                  // background: Image.network(
                  //   "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png",
                  //   fit: BoxFit.cover,
                  // ) //Images.network
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
              // Container(
              //     child: ListView.builder(
              //         itemCount: list.length,
              //         itemBuilder: (context, index) {
              //           return getColumnCard(
              //             list[index],
              //           );
              //         })),


              //first tab
              PagedListView<int, UserModel>.separated(

                // physics:  AlwaysScrollableScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<UserModel>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) =>
                      UserItem(userModelItem: item, index: index),
                  // getColumnCard(item, index , context),
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


}
  
//
// Widget getColumnCard(UserModel model , int index, BuildContext context) {
//     return Container(
//       height: 100,
//       margin: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20), color: Colors.red),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 model.name + " "+index.toString(),
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               )),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 model.family,
//                 style: TextStyle(color: Colors.white, fontSize: 15),
//               ))
//         ],
//       ),
//     );
//   }
// }
