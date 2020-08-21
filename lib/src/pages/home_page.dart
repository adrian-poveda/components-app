import 'package:components_app/src/pages/alert_page.dart';
import 'package:flutter/material.dart';

import 'package:components_app/src/providers/menu_provider.dart';
import 'package:components_app/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list()
    );
  }

  Widget _list() {

    //print(menuProvider.options);
    //menuProvider.dataLoad();
    return FutureBuilder(
      future: menuProvider.dataLoad(), //Lo que nosotros esperamos
      initialData: [], //Lista vacía inicialmente
      builder: ( context , AsyncSnapshot<List<dynamic>> snapshot ){

        return ListView(
          children: _itemsList(snapshot.data, context),
        );
      },
    );

    //return ListView(
      //children: _itemsList(),
    //);

  }

  List<Widget> _itemsList(List<dynamic> data, BuildContext context) {

    final List<Widget> widgetList = [];

    data.forEach( (opt) {
      final currentWidget = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {

          final route = MaterialPageRoute(
            builder: ( context ){
              return AlertPage();
            }
          );
          Navigator.push(context, route);
        },
      );

      widgetList..add(currentWidget)
                ..add(Divider());

    });

    return widgetList;
  }
}