import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatar Page'),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            child: Text('APS'),
            backgroundColor: Colors.white,
          ),
        ),
      ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
              child: FadeInImage(
                image: NetworkImage('https://www.adrianpovedasanchis.com/static/portfolio/adri.jpeg'),
                placeholder: AssetImage('assets/original.gif'),
                height: 325, //Añadir las propiedades de Height y Fit para que si la imagen de placeholder y la
                fit: BoxFit.cover // buena no son del mismo tamaño, se ajusten y no varíe el tamaño.
              )
            ),
            Divider(),
            Center(
              child: Text('Adrián Poveda Sanchis'),
            )
          ],
        ),
      ),
    );
  }
}