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
        // initialData: [
        //   Image(image: AssetImage('assets/loading.gif'), )
        // ],
        builder: (context, AsyncSnapshot<List <dynamic>> snapshot) => snapshot.data!=null?
          Center(
          child: ListView(
            children: newBody(context:context, data:snapshot.data),
          ),):Image(image: AssetImage('assets/loading.gif'), )
      )
    );
  }

  List <Widget> newBody({BuildContext context, List<dynamic> data}){
    List <Widget> response = [
      SizedBox(height: 30),
    ];
    for (var item in data) {
      response..add(
        ListTile(
          title: Pedidos(getOcupped: true,id: item['id'].toString(), name:item['mesero']['nombre'], platillos: item['platillos'],)
        ),
      )..add(SizedBox(height: 45,));
    }
    return response;
  }
}
