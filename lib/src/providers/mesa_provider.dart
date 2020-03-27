import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

final _MesaProvider myMesaProv = _MesaProvider();

class _MesaProvider{
  List<dynamic> options =[];

  Future<List<dynamic>> cargarData() async {
    final response = await rootBundle.loadString('data/mesa.json');
    Map dataMap = json.decode(response);
    
    final List<dynamic> mesa = dataMap["data"];
    return mesa;
  }
}