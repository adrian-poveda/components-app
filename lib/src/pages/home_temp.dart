import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final options = ['Persona 1', 'Persona 2', 'Persona 3', 'Persona 4'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }


  List<Widget> _createItems() {

    List<Widget> list = new List<Widget>();

    for (String opt in options) {

      final currentOptionWidget = ListTile(
        title: Text(opt),
      );

      list..add(currentOptionWidget)
          ..add(Divider());
      
    }

    return list;
  }


  List<Widget> _createItemsShort() {
    return options.map( ( item ) {
      return Column(
        children: [
          ListTile(
            title: Text( item ),
            subtitle: Text('Email'),
            leading: Icon(Icons.account_circle, size: 60,),
            trailing: Icon(Icons.arrow_forward_ios, size: 17),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

  }





}