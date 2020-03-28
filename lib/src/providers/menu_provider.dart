import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../urls.dart';

final _MenuProvider myMenuProv = _MenuProvider();

class _MenuProvider{
  List<dynamic> options =[];

  Future<List<dynamic>> cargarData() async {
    final http.Response consultResponse = await http.get('${urls().site}api/platillos');

    Map dataMap = {'data':json.decode(consultResponse.body)};
    
    final List<dynamic> mesa = dataMap["data"];
    return mesa;
  }
}