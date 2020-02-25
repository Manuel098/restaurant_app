import 'package:flutter/material.dart';
import 'package:restauran_app/routes.dart';
import 'package:restauran_app/src/pages/home/index_home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // home: ,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setings){
        return MaterialPageRoute(
          builder: (BuildContext context) => Home()
        );
      },
    );
  }
}