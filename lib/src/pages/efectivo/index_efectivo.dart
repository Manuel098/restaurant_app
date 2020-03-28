import 'package:flutter/material.dart';
import 'package:restauran_app/src/providers/efectivo_provider.dart';

class Efectivo extends StatefulWidget {
  Efectivo({Key key}) : super(key: key);

  @override
  _EfectivoState createState() => _EfectivoState();
}

class _EfectivoState extends State<Efectivo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Efectivo Total',),),
      body: FutureBuilder(
        future: myEfectProv.cargarData(),
        builder: (context, AsyncSnapshot<List <dynamic>> snapshot) => snapshot.data!=null?
        newBody(context:context, data:snapshot.data):Image(image: AssetImage('assets/loading.gif'))
      ),
    );
  }

  Card newBody({BuildContext context,List<dynamic> data}){
    List<Widget> numero = [
      Container(margin: EdgeInsets.only(left:5, right: 5,top:10),
        child: Text('Numero de mesa', style: TextStyle(color: Colors.white)), padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlueAccent
        )
      ),
    ];
    List<Widget> precio = [
      Container(margin: EdgeInsets.only(left:5, right: 5,top:10),
        child: Text('Total generado', style: TextStyle(color: Colors.white)), padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlueAccent
        )
      )
    ];
    double porcentual = 0, total = 0;


    for (var mesa in data) {
      numero.add(Container(margin: EdgeInsets.only(left:5, right: 5,top:10),
        child: Text('${mesa['number']}', style: TextStyle(color: Colors.white)), padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlueAccent
        )
      ));
      for (var platillo in mesa['platillos']) {
        porcentual += platillo['info_platillo'][0]['precio'];
      }
      precio.add(Container(margin: EdgeInsets.only(left:5, right: 5,top:10),
        width: 80,
        child: Text('$porcentual', style: TextStyle(color: Colors.white)), padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlueAccent
        )
      ));
      total+=porcentual;
      porcentual = 0;
    }

    return Card(elevation: 4, margin: EdgeInsets.only(left:20, right: 20,top:40) ,child: Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
      Column(
        children: <Widget>[
          Row(children: <Widget>[
            SizedBox(width: 30,),
            Column(children: numero),
            SizedBox(width: 60,),
            Column(children: precio, crossAxisAlignment: CrossAxisAlignment.start,),
          ],),
          SizedBox(height: 25,),
          Text('Total generado \$ $total',style: TextStyle(fontSize: 20),),
          SizedBox(height: 15,),
        ],
      )
      
    ],),);
  }
}