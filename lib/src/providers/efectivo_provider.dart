import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../urls.dart';


final _EfectivoProvider myEfectProv = _EfectivoProvider();

class _EfectivoProvider{
  List<dynamic> options =[];

  Future<List<dynamic>> cargarData() async {
    final http.Response consultResponse = await http.get('${urls().site}api/platillomesa');

    Map dataMap = {'data':json.decode(consultResponse.body)};
    
    final List<dynamic> efectivo = dataMap["data"];
    return efectivo;
  }
}