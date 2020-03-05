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
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.only(top: 150, bottom: 250, left: 30, right: 30),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: ListView(
                    //padding: EdgeInsets.only(top: 15, bottom: 15),
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
                        ),
                        SizedBox(height: 50,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            InkWell(
                              child: Container(
                                height: 30,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red
                                ),
                                child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                              ),
                              onTap: (){
                                print('Item agregado!');
                                Navigator.pop(context);
                              },
                            ),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 80,
                                //color: Colors.blue,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.blue
                                ),
                                child: Text('Submit', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                              ),
                              onTap: (){
                                print('Cancelado!');
                                Navigator.pop(context);
                              },
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  )                               
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
                onTap: (){
                  print('Producto Borrado!');
                },
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