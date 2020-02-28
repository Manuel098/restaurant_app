import 'package:flutter/material.dart';

class Inventario extends StatefulWidget {
  Inventario({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InventarioState createState() => _InventarioState();
}

class _InventarioState extends State<Inventario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      floatingActionButton: Container(
        width: 110,
        height: 45,        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[400],Colors.lightBlue[300]],           
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          child:Center(
            child:Text(
              'Agregar',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ),
          onTap: (){
            print('Allahu Akbar :v');
          },
        )  
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            child: DataTable(sortColumnIndex: 2, sortAscending: true, columns: [
              DataColumn(label: Text('Producto')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Cantidad'), numeric: true,),
              DataColumn(label: Text('Accion')),
            ], rows: [
              DataRow(selected: true, cells: [
                DataCell(Text('1')),
                DataCell(Text('Tomate')),
                DataCell(Text('\$87.00')),
                DataCell(Text(' ')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('Aguacate')),
                DataCell(Text('\$38.00')),
                DataCell(Text(' ')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('Cebolla')),
                DataCell(Text('\$11.00')),
                DataCell(Text(' ')),
              ]),
            ])),
      ),
    );
  }
}