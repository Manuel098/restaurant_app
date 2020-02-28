import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          SizedBox(height: 70,),
          _card(title: 'Inventario',context: context, route: '/invent',image: 'https://adventech-soluciones.com/wp-content/uploads/2019/05/inventario-icono-png.png'),
          SizedBox(height: 35,),
          _card(title: 'Menu',context: context, route: '/menu',image: 'https://previews.123rf.com/images/faysalfarhan/faysalfarhan1604/faysalfarhan160400670/55094243-men%C3%BA-icono-plato-de-comida-bot%C3%B3n-marr%C3%B3n-cuadrado.jpg'),
          SizedBox(height: 35,),
          _card(title: 'Mesas',context: context, route: '/mesa',image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQZsakAxtGa5oQONKOWacchdGGyGr2suVWm-U0qbG7lciLcX0o7')
        ],
      ),
    );
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