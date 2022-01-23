import 'package:flutter/material.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/model/user_model.dart';


class UserItem extends StatefulWidget {
   UserModel userModelItem;
   int index ;

   UserItem({Key? key , required this.userModelItem ,  required this.index }) : super(key: key);

  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                widget.userModelItem.name + " "+widget.index.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                widget.userModelItem.family,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ))
        ],
      ),
    );
  }
}
