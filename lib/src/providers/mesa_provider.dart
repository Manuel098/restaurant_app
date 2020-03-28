import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../urls.dart';


final _MesaProvider myMesaProv = _MesaProvider();

class _MesaProvider{
  List<dynamic> options =[];

 

  Future<List<dynamic>> cargarData() async {
    final http.Response consultResponse = await http.get('${urls().site}api/mesamesero/1');

    Map dataMap = {'data':json.decode(consultResponse.body)};
    
    final List<dynamic> mesa = dataMap["data"];
    return mesa;
  }
}