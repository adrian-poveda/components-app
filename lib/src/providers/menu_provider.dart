
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {

List<dynamic> options = [];

_MenuProvider(){
  //dataLoad();

}

Future<List<dynamic>> dataLoad() async {
  final resp = await rootBundle.loadString('data/menu_opts.json');

  Map dataMap = json.decode( resp );
  print (dataMap['rutas'] );

  options = dataMap['rutas'];

  return options;
  
}

}

final menuProvider = new _MenuProvider();