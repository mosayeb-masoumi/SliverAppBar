import 'package:flutter/material.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/pages/silver_pagination.dart';
import 'package:silver_app_bar1/simple_tabbar/silver_page1.dart';
import 'package:silver_app_bar1/video_silver2/pages/video_list2.dart';
import 'video_tabbar_silver_appbar/pages/video_list.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          SizedBox(height: 20,),
          RaisedButton(child: Text("simple tabbar silver appbar"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SilverPage1()),
            );
          }),

          SizedBox(height: 10,),


          RaisedButton(child: Text("SilverPagination"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SilverPagination()),
            );
          }),


          SizedBox(height: 10,),

          RaisedButton(child: Text("VideoSilverPagination"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoList()),
            );
          }),

          SizedBox(height: 10,),
          RaisedButton(child: Text("VideoSilverPagination2"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoList2()),
            );
          }),

        ],
      ),
    );
  }
}
