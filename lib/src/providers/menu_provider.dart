import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

final _MenuProvider myMenuProv = _MenuProvider();

class _MenuProvider{
  List<dynamic> options =[];

  Future<List<dynamic>> cargarData({ @required String permission}) async {
    final response = await rootBundle.loadString('data/menu.json');
    Map dataMap = json.decode(response);
    
    final List<dynamic> admin = dataMap['menu'];

    return admin;
  }
}