import 'package:flutter/material.dart';
import 'package:silver_app_bar1/model.dart';

class ItemWidget extends StatefulWidget {

  var myModel;
  ItemWidget({
    this.myModel
  });

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       child: Text(widget.myModel.name),
      // height: 100,
      // margin: EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20), color: Colors.red),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //         padding: EdgeInsets.only(left: 20),
      //         child: Text(
      //           widget.myModel.name,
      //           style: TextStyle(color: Colors.white, fontSize: 20),
      //         )),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Container(
      //         padding: EdgeInsets.only(left: 20),
      //         child: Text(
      //           widget.myModel.family,
      //           style: TextStyle(color: Colors.white, fontSize: 15),
      //         ))
      //   ],
      // ),
    )
    );
  }
}

