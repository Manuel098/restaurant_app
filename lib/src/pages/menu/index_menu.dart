import 'package:flutter/material.dart';
import 'package:restauran_app/src/providers/menu_provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Menu'),),
      body: FutureBuilder(
        future: myMenuProv.cargarData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) =>
          snapshot.data!=null?_cardsMenu(data: snapshot.data):Image(image: AssetImage('assets/loading.gif'))
      ),
    );
  }

  ListView _cardsMenu({List<dynamic> data}) {
    List<Widget> content=[];
    
    if (data!=null&&data.length>0) {
      for (var item in data) {
        content.add(ListTile(title: Center(child: Text(item['nombre'],style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900, color: Colors.lightBlueAccent),))));
        for (var plat in item['info_platillo']) {
          content.add(ListTile(
            title: Card(
              elevation: 15,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Center(child: Text(plat['nombre'], style: TextStyle( fontSize: 25),),),
                  FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'), 
                    image: NetworkImage(plat['URL']),
                    fadeInDuration: Duration(seconds: 1),
                    height: 150,
                    fit: BoxFit.cover,),
                  SizedBox(height: 10),
                  Center(child: Text('Precio \$ ${plat['precio']}', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),),),
                  SizedBox(height: 10),
                ],
                mainAxisSize: MainAxisSize.min,
              ),
              margin: EdgeInsets.only(left:20, right:20, bottom: 10),
            ),
          ));
        }
      } 
    }
    return ListView(
      children: content
    );
  }
}
