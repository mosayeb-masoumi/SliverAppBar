import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:silver_app_bar1/simple_tabbar/model.dart';
// import 'package:silver_app_bar1/item_widget.dart';
// import 'package:silver_app_bar1/model.dart';

class SilverPage1 extends StatefulWidget {

  @override
  _SilverPage1State createState() => _SilverPage1State();
}

class _SilverPage1State extends State<SilverPage1> {
  List<ModelInfo> list = [];

  bool showGridList = false;

  @override
  void initState() {
    initialList();
    super.initState();
  }

  void initialList() {
    list.add(ModelInfo("ali", "rezai"));
    list.add(ModelInfo("milad", "moradi"));
    list.add(ModelInfo("mina", "akbari"));
    list.add(ModelInfo("fiza", "leonardo"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: 70,
        actions: [
          IconButton(
            icon: Icon(
              Icons.view_module_rounded,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                showGridList = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.view_agenda,
              size: 25,
            ),
            onPressed: () {
              setState(() {
                showGridList = false;
              });
            },
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                expandedHeight: 200,
                // collapsedHeight: 100,
                toolbarHeight: 50,
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                // to remove back button



                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Stack(
                        children: [
                          Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png",
                            fit: BoxFit.cover,
                          ),
                          Align(
                            // alignment: Alignment.center,
                            child: Container(
                              child: Text("jsfgshdkhgkhs"),
                              // color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                bottom: TabBar(
                  indicatorColor: Colors.yellow,
                  // indicatorColor: Color(0xffF15C22),
                  labelColor: Colors.yellow,
                  unselectedLabelColor: Colors.red,
                  tabs: [
                    Tab(text: "Call"),
                    Tab(text: "Message"),
                    Tab(text: "Test"),
                  ],
                ),
              ),


            ];
          },
          body: TabBarView(
            children: [
              Container(
                  child: showGridList
                      ? GridView.builder(

                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return getColumnCard(list[index],);
                      // ModelInfo model = list[index];
                      // return new ItemWidget(myModel:model);
                    }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , childAspectRatio: (1 / .6),),)

                      : ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        // ModelInfo model = list[index];
                        return getColumnCard(list[index],);
                        // return ItemWidget(myModel:model);

                      })),

              Container(
                  child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Text("Item $index");
                      })),
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

  Widget getColumnCard(ModelInfo list) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(5),

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                list.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                list.family,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
      ),
    );
  }


}
