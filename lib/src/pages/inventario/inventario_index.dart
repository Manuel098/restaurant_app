import 'package:flutter/material.dart';
import 'dart:math';

class Inventario extends StatefulWidget {
  Inventario({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InventarioState createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {

  TextEditingController textController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[400],Colors.lightBlue[300]],           
          ),
          borderRadius: BorderRadius.circular(50)
        ),
        child: InkWell(
          child:Center(
            child:Icon
            (
              Icons.add,
              color: Colors.white,
              size: 40,
            )
          ),
          onTap: (){
            return showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text('Add Products'),
                  content: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      TextField(
                        controller: textController, 
                        decoration: InputDecoration(
                          hintText: 'Product´s name'
                        ),                                     
                      ),
                      TextField(
                        controller: quantityController, 
                        decoration: InputDecoration(
                          hintText: 'Quantity'
                        ),                                     
                      )
                    ],
                  ),
                  
                  actions: <Widget>[
                    MaterialButton(
                      elevation: 5.0,
                      child: Text('Cancel'),
                      onPressed: (){}
                    ),
                    MaterialButton(
                      elevation: 5.0,
                      child: Text('Sumbmit'),
                      onPressed: (){}
                    )
                  ],
                );
              }
            );
          },
        )  
      ),
      body: Card(
        elevation: 5,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            child: DataTable(sortColumnIndex: 2, sortAscending: true, columns: [
              DataColumn(label: Text('Producto')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Cantidad'), numeric: true,),
              DataColumn(label: Text('Accion')),
            ], rows: [
              dataRow(1,"Tomate",2),
              dataRow(2,"Cebolla",50),
              dataRow(3,"Cilantro",95),
            ])),
      ),
    );
  }

  DataCell datCant(int cant)
  {
    return DataCell(
      Container(
        padding: EdgeInsets.all(8),
        child:Text(cant.toString(), style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          gradient: LinearGradient(                        
            colors: [cant >= 100 ? Colors.green[400] : calculateInterpolation(cant) ,cant >= 100 ? Colors.green[300] : calculateInterpolation(cant)],                        
          ),
          borderRadius: BorderRadius.circular(25)
        ),
      )
    );
  }

  DataRow dataRow(int id, String name, int cant){
    return DataRow(     
      cells: [
        DataCell(Text(id.toString())),
        DataCell(Text(name)),
        datCant(cant),
        DataCell(
          Center(
            child: InkWell(
                child:Icon(Icons.delete),
                onTap: (){},
              ),
          ),
          showEditIcon: true
        ),
    ]);
  }

  Color calculateInterpolation(int numer)
  {
    return Color.fromARGB(255, ((61 + (1.58)*(100-numer))).round(), ((219 - (1.58) * (100-numer))).round(), ((77 - (0.16)*(100-numer))).round());
  }
}