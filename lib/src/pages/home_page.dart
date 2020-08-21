import 'package:components_app/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

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
          children: _itemsList(snapshot.data),
        );
      },
    );

    //return ListView(
      //children: _itemsList(),
    //);

  }

  List<Widget> _itemsList(List<dynamic> data) {

    final List<Widget> widgetList = [];

    data.forEach( (opt) {
      final currentWidget = ListTile(
        title: Text(opt['texto']),
        leading: Icon(Icons.add),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      );

      widgetList..add(currentWidget)
                ..add(Divider());

    });

    return widgetList;
  }
}