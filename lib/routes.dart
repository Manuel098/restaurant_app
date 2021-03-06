import 'package:flutter/material.dart';
import 'package:restauran_app/src/pages/efectivo/index_efectivo.dart';
import 'package:restauran_app/src/pages/home/index_home.dart';
import 'package:restauran_app/src/pages/inventario/inventario_index.dart';
import 'package:restauran_app/src/pages/login-registro/login.dart';
import 'package:restauran_app/src/pages/menu/index_menu.dart';
import 'package:restauran_app/src/pages/mesa/index_mesa.dart';
import 'package:restauran_app/src/pdf/GeneratePdf.dart';

Map <String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/index': (BuildContext context) => Home(),
    '/mesa' : (BuildContext context) => Mesa(),
    '/menu' : (BuildContext context) => Menu(),
    '/' : (BuildContext context) => LoginPage(),
    '/ticket' : (BuildContext context) => Ticket(),
    '/invent' : (BuildContext context) => Inventario(),
    '/totalMoney': (BuildContext context) => Efectivo(),
    
  };
}