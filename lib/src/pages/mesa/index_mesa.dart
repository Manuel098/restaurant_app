import 'package:flutter/material.dart';

class Mesa extends StatelessWidget {
  const Mesa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mesa Page'),),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60,),
            ListTile(
              title: _cardUser(name: 'Jose Manuel Valdez Gonzalez',id: '1'),
              onTap: ()=>_alertMesas(cont: context,data: [
                {'num':'1'},{'num':'2'},{'num':'3'},{'num':'3'},{'num':'3'},{'num':'3'}
              ]),
            ),
            SizedBox(height: 45,),
            ListTile(
              title: _cardUser(name: 'David Alejandro Rueda Rivas',id: '2'),
              onTap: ()=>_alertMesas(cont: context,data: [
                {'num':'1'},{'num':'2'},{'num':'3'},{'num':'3'}
              ]),
            ),
            SizedBox(height: 45,),
            ListTile(
              title: _cardUser(name: 'Christian Antonio Avila Saucedo',id: '4'),
              onTap: ()=>_alertMesas(cont: context,data: [
                {'num':'3'},{'num':'3'},{'num':'3'}
              ]),
            ),
            SizedBox(height: 45,),
            _cardUser(name: 'Ernesto',id: '3'),
            SizedBox(height: 45,),
          ],
        )
      )
    );
  }

  _cardUser({String name, String id})=>Card(
    margin: EdgeInsets.only(left:50, right: 50),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 15,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.perm_contact_calendar,size: 300, color: Colors.black26,),
        Row(
          children: <Widget>[
            Container(child: Text(name,style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold),
            ),width: 200,),
            SizedBox(width: 20,),
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

  void _alertMesas({List data, BuildContext cont}){
    showDialog(context: cont, builder: (cont){
      List<Row> mesas = List<Row>();
      for (var item in data) {
        mesas.add(Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Mesa ${item['num']}'),
            ButtonBar(children: <Widget>[
              RaisedButton(onPressed: (){},child: Icon(Icons.navigate_next, color: Colors.white70,),color: Colors.green,elevation: 12, disabledColor: Colors.green,),
              RaisedButton(onPressed: (){},child: Icon(Icons.cancel, color: Colors.white70,),color: Colors.red,elevation: 12,)
            ],),
          ],
        ));
      }

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text('Mesas'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: mesas
        ),
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text('Continuar')),
          FlatButton(onPressed: ()=>Navigator.of(cont).pop(), child: Text('Salir')),
        ],
      );
    });
  }
}