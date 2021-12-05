import 'package:flutter/material.dart';

class SilverPage3 extends StatefulWidget {
  @override
  _SilverPage3State createState() => _SilverPage3State();
}

class _SilverPage3State extends State<SilverPage3> {
  static const double kExpandedHeight = 200.0;

  List<Item> items = [
    Item('Item0', 'Item 0 desc'),
    Item('Item1', 'Item 1 desc'),
    Item('Item2', 'Item 2 desc'),
    Item('Item3', 'Item 3 desc'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: kExpandedHeight,
              pinned: true,
              floating: false,
              snap: false,
              forceElevated: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Items'),
                    ]
                ),
                // background: Image.network('https://www.pngall.com/wp-content/uploads/2016/04/Free-PNG-Picture.png',
                //   // fit: BoxFit.cover,
                // ),

                background: Center(
                  child: Container(
                    child: Text("etxt"),
                  ),
                )
                
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
          ];
        },
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      child: ItemListing(items: items, onItemTap: (item) {print('NAVIGATE TO DETAILS');}, onItemLongPress: (item) {print('NAVIGATE TO EDIT');},),
    );
  }
}





class ItemListing extends StatelessWidget {
  ItemListing({
    required this.items,
    required this.onItemTap,
    required this.onItemLongPress,
    this.selectedItem
  });

  final List<Object> items;
  final ValueChanged<Object> onItemTap;
  final ValueChanged<Object> onItemLongPress;
  final dynamic selectedItem;

  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
      child: Text('No items.', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
    )
        : ListView.builder(
      shrinkWrap: false,
      controller: _scrollController,
      itemCount: items.length,
      itemBuilder: (context, index) =>
          _buildListItem(context, items[index], index),
    );
  }

  Widget _buildListItem(BuildContext context, dynamic data, int index) {
    return Padding(
      key: ValueKey(data.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
          isThreeLine: false,
          title: Text(data.name, style: TextStyle(fontSize: 20.0)),
          // subtitle: Text(_getDateForDisplay(route.createdOn)),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(data.description),
              Text('Created by User'),
            ],
          ),
          trailing: Text('#$index', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          onTap: () => onItemTap(data),
          onLongPress: () => onItemLongPress != null ? onItemLongPress(data) : {},
          selected: selectedItem?.name == data.name,
        ),
      ),
    );
  }
}


class Item {
  String name;
  String description;

  Item(this.name, this.description);

// Item(String name, String description) {
  //   this.name = name;
  //   this.description = description;
  // }
}