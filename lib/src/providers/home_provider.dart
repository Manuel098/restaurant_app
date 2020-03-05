import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

final _HomeProvider myMenuProv = _HomeProvider();

class _HomeProvider{
  List<dynamic> options =[];

  Future<List<dynamic>> cargarData({ @required String permission}) async {
    final response = await rootBundle.loadString('data/home.json');
    List<dynamic> list =List<dynamic>();
    Map dataMap = json.decode(response);
    
    List<dynamic> admin = dataMap['admin'];
    List<dynamic> mesero = dataMap['mesero'];

    permission == 'admin'?list = admin: list = mesero;
    return list;
  }
}