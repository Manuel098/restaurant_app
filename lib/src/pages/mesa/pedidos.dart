import 'package:flutter/material.dart';

class Pedidos extends StatefulWidget {
  final bool getOcupped;
  final String id, name;
  final List<dynamic> platillos;

  Pedidos({Key key, this.getOcupped = false, this.id, this.name, this.platillos}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState(ocupped: getOcupped, name: name, id: id, platillos: platillos);
}

class _PedidosState extends State<Pedidos> {
  bool ocupped;
  String name, id;
  List<dynamic> platillos;
  List<Widget> conten = [];


  _PedidosState({this.name = 'asd', this.id = '1', this.ocupped = false,this.platillos}){
    if(platillos.length>0){
      for (var platillo in platillos) {
        conten.add(Row(
          children: <Widget>[
            SizedBox(width: 20,),
            Container(
              child: Text('${platillo['info_platillo'][0]['nombre']}',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              width:160,
            ),
            SizedBox(width: 35,),
            Container(
              child: Text(" \$ ${platillo['info_platillo'][0]['precio']}",style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 253, 253, 253),
                fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(top:15),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.lightBlueAccent,
              ),
            )
          ],
        ));
      }
      
      conten.add(SizedBox(height: 25,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left:10, right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: ocupped?_trueContain(name:name, id:id):_falseContain(id:id),
      ),
    );
  }

  List<Widget> _trueContain({String name, String id})=>[
    Row(
      children: <Widget>[
        SizedBox(width: 20,),
        Container(
          child: Text('La mesa $id esta atendida por',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          width:160,
        ),
        SizedBox(width: 35,),
        Container(
          child: Text(name,style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 253, 253, 253),
            fontWeight: FontWeight.bold),
          ),
          width: 110,
          margin: EdgeInsets.only(top:15),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.lightBlueAccent,
          ),
        )
      ],
      mainAxisSize: MainAxisSize.min,
    ),
    SizedBox(height: 25,),
    Text('Cuenta', style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold
    ),),
    SizedBox(height: 10,),
    Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: conten
      ),
    ),
    SizedBox(height: 25,),
    Row(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        SizedBox(width: 60,),
        FlatButton(onPressed: (){}, child: Text('Agregar Platillo') ,hoverColor: Color.fromARGB(255, 253, 253, 253), ),
      ],
    ),
    Center(
      child: FlatButton(onPressed: (){}, child: Text('Generar Cuenta') ,hoverColor: Color.fromARGB(255, 253, 253, 253), ),
    )
  ];

  List<Widget> _falseContain({String id})=>[
    Row(
      children: <Widget>[
        Container(
          child: Text('La mesa $id se encuentra',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          width:160,
        ),
        SizedBox(width: 60,),
        Container(
          child: Text('Libre',style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 253, 253, 253),
            fontWeight: FontWeight.bold),
          ),
          width: 60,
          margin: EdgeInsets.only(top:15),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.lightBlueAccent,
          ),
        )
      ],
      mainAxisSize: MainAxisSize.min,
    ),
    SizedBox(height: 20,),
    Center(
      child: Icon(Icons.notifications_paused, size: 55, color: Color.fromARGB(255, 226, 242, 246),),
    ),
    SizedBox(height: 20,),
  ];
}
