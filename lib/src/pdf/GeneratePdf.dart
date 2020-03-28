import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:restauran_app/src/pdf/PdfPreviewScreen.dart';

class Ticket extends StatefulWidget {
  Ticket({Key key}) : super(key: key);

  @override
  _TicketState createState() => _TicketState();
}

String selecteditem;
int cantidad;

class _TicketState extends State<Ticket> {

  String selecteditem;
  final pdf = pw.Document();

  writeOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a5,
        margin: pw.EdgeInsets.all(32),

        build: (pw.Context context){
          return <pw.Widget>  [
            pw.Header(
              level: 0,
              child: pw.Text("Total a pagar de la mesa 1")
            ),

            //Esto es un parrafo, puedes agregar los que quieras como si fuera un arreglo de widgets
            pw.Paragraph(
              text: "\$$cantidad"
            ),
            pw.Paragraph(
              text: "\$200"
            ),

          ];
        },
      )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Generar Cuenta"),
      ),

      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Seleccione Mesa',style: TextStyle(fontSize: 20),),
             DropDownList()
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          writeOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";

          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreviewScreen(path: fullPath,)
          ));

        },
        child: Icon(Icons.save),
      ), 

    );
  }
}

class DropDownList extends StatefulWidget {
  DropDownList({Key key}) : super(key: key);

  
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: DropdownButton<String>(
        items: <String>['Mesa 1', 'Mesa 2', 'Mesa 3', 'Mesa 4'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
          onChanged:(String newValue) {
            setState(() {
              selecteditem = newValue;
              print(selecteditem);
            });
          },
        ),
    );    
  }
}