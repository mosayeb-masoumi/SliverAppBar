import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/model/user_List_model.dart';
import 'package:silver_app_bar1/pagination_tabbar_silver_appbar/model/user_model.dart';

class MyRepository{



  Future<UserListModel> fetchPalyListName(int pageKey, int pageSize) async{

    await Future.delayed(Duration(seconds: 2));

    List<UserModel> list = [];
    list.add(new UserModel( "ali" ,"ali"));
    list.add(new UserModel("reza" ,"ali"));
    list.add(new UserModel("hasan" ,"ali"));
    list.add(new UserModel("ali" ,"ali"));
    list.add(new UserModel("reza" ,"ali"));
    list.add(new UserModel("hasan" ,"ali"));
    list.add(new UserModel("ali" ,"ali"));
    list.add(new UserModel("reza" ,"ali"));

    UserListModel userListModel = UserListModel(list);

    return userListModel;

  }

}