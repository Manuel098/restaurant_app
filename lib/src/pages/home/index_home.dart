import 'package:flutter/material.dart';
import 'package:restauran_app/src/pages/home/popUp.dart';
import 'package:restauran_app/src/providers/home_provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FloatingActionButton(
            elevation: 20,
            onPressed: ()=> shouAlert(cont: context),
            child: CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(Icons.perm_contact_calendar, size: 45,),radius: 100,
            ),
          ),
        ],
      ),
      body: _list(),
    );
  }

  Widget _list() => FutureBuilder(
    future: myMenuProv.cargarData(permission: 'admin'),
    initialData: [],
    builder: (context, AsyncSnapshot<List <dynamic>> snapshot) => 
      ListView(children: _listItems(lista : snapshot.data, context:context),)
  );

  List<Widget> _listItems({List<dynamic> lista, BuildContext context}) {
    List<Widget> menuList = List<Widget>();
    
    menuList.add(SizedBox(height: 30,));
    for (var item in lista) {
      menuList..add(_card(image: item['URL'], route: '/${item['route']}', title: item['title'],context: context))..add(SizedBox(height: 35,));
    }  
    return menuList;
  }

  ListTile _card({String title, String image, BuildContext context ,String route})=>ListTile(
    title: Card(elevation: 8,
    child: Column(children: <Widget>[
      FadeInImage(
        placeholder: AssetImage('assets/loading.gif'), 
        image: NetworkImage(image),
        fadeInDuration: Duration(seconds: 1),
        height: 150,
        fit: BoxFit.cover,),
      Container(child: Text(title, style: TextStyle( fontSize: 20),), padding: EdgeInsets.symmetric(vertical: 10),)
    ],),),
    onTap: (){
      Navigator.pushNamed(context, route);
    },
  );
}