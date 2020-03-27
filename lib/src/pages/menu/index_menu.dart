import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';


class MenuItem {
  final String name, url;
  final double cost;
  final int categoryId;

  MenuItem(this.name, this.url, this.cost, this.categoryId);
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<MenuItem>(
            onSearch: search,
            onItemFound: (MenuItem post, int index){
              return _cardMenu(name: post.name, id: post.url);
            },
            icon: Icon(Icons.search),
            searchBarStyle: SearchBarStyle(
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        )),
    );
  }
}


_cardMenu({String name, String id})=>Card(
    margin: EdgeInsets.only(left:50, right: 50, bottom: 40, top: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.perm_contact_calendar,size: 300, color: Colors.black26,),
        Text(name,style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Text(id,style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 100,),
          ],
          mainAxisSize: MainAxisSize.min,
        )
      ],
    ),
  );


Future<List<MenuItem>> search(String name) async {
  await Future.delayed(Duration(seconds: 1));
  return List.generate(name.length, (int index) {
    return MenuItem(
      name,
      name,
      12.0,
      1
    );
  });
}

