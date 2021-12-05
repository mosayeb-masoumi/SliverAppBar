import 'package:flutter/material.dart';
import 'package:silver_app_bar1/silver_page1.dart';
import 'package:silver_app_bar1/silver_page2.dart';
import 'package:silver_app_bar1/silver_page3.dart';

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
          RaisedButton(child: Text("btn1"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SilverPage1()),
            );
          }),

          SizedBox(height: 10,),

          RaisedButton(child: Text("btn2"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SilverPage2()),
            );
          }),

          SizedBox(height: 10,),

          RaisedButton(child: Text("btn2"), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SilverPage3()),
            );
          }),


        ],
      ),
    );
  }
}
