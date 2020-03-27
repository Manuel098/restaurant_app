import 'package:flutter/material.dart';
import 'package:restauran_app/src/pages/mesa/pedidos.dart';
import 'package:restauran_app/src/providers/mesa_provider.dart';

class Mesa extends StatelessWidget {
  const Mesa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mesas'),),
      body: FutureBuilder(
        future: myMesaProv.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List <dynamic>> snapshot) => Center(
          child: ListView(
            children: newBody(context:context, data:snapshot.data),
          ),
        )
      )
    );
  }

  List <Widget> newBody({BuildContext context, List<dynamic> data}){
    List <Widget> response = [
      SizedBox(height: 30)
    ];
    for (var item in data) {
      response..add(
        ListTile(
          title: Pedidos(getOcupped: true,id: item['id'].toString(), name:item['mesero']['nombre'], platillos: item['platillos'],),
          onTap: ()=>_alertMesas(cont: context,data: [
            {'num':'1'},{'num':'2'},{'num':'3'},{'num':'3'},{'num':'3'},{'num':'3'}
          ]),
        ),
      )..add(SizedBox(height: 45,));
    }
    return response;
  }

  void _alertMesas({List data, BuildContext cont}){
    showDialog(context: cont, builder: (cont){
      List<Row> mesas = List<Row>();
      for (var item in data) {
        mesas.add(Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Mesa ${item['num']}'),
            ButtonBar(children: <Widget>[
              RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), onPressed: (){},child: Icon(Icons.navigate_next, color: Colors.white70,),color: Colors.green,elevation: 22, disabledColor: Colors.green,),
              RaisedButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), onPressed: (){},child: Icon(Icons.cancel, color: Colors.white70,),color: Colors.red,elevation: 22,)
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
