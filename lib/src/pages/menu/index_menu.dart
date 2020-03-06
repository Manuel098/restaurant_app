import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';


class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Menu page'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index){
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
            icon: Icon(Icons.search),
            searchBarStyle: SearchBarStyle(
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          )
          
        ),
    );
  }
}





Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 1));
  return List.generate(search.length, (int index) {
    return Post(
      "Title : $search $index",
      "Description :$search $index",
    );
  });
}

