import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context); //Para volver a la pantalla anterior
        },
      ),
      body: Center(
        child: RaisedButton(
          child: Text('First Alert!'),
          color: Colors.blue,
          onPressed:() => _showAlert(context),
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

 void _showAlert(BuildContext context) {
   showDialog(
     context: context,
     barrierDismissible: true,
     builder: (context) {
       return AlertDialog(
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
         title: Text('Alert Title'),
         content: Column(
           mainAxisSize: MainAxisSize.min, //Se adapta al contenido interno
           children: [
             //El texto metido en un container para poder alinearlo a la izquierda
             Container(child: Text('This is the alert content'), alignment: Alignment.centerLeft),
             Container(child: FlutterLogo( size: 100), padding: EdgeInsets.only(top: 20))
           ],
         ),
         actions: [
           FlatButton(
             child: Text('Cancel'),
             onPressed: () => Navigator.of(context).pop(), //Para cerrar la alerta
           ),
           FlatButton(
             child: Text('OK'),
             onPressed: () => Navigator.of(context).pop(), //Para cerrar la alerta
           )
         ],
       );
     }
   );
 }
}