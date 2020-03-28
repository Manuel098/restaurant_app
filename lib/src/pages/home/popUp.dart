import 'package:flutter/material.dart';

void shouAlert({BuildContext cont})=>showDialog(context: cont, builder: (cont){
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    titleTextStyle: TextStyle(),
    
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(onPressed: (){
          Navigator.of(cont).pop();
          Navigator.pushNamed(cont, '/');
        },child: Text('Cerrar Sesion'),color: Colors.red, textTheme: ButtonTextTheme.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),)
      ]));
});
