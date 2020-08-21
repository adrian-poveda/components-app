import 'package:flutter/material.dart';


import 'package:components_app/src/pages/alert_page.dart';
import 'package:components_app/src/pages/avatar.dart';
import 'package:components_app/src/pages/home_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/' : ( BuildContext context ) => HomePage(),
        'alert' : ( BuildContext context ) => AlertPage(),
        'avatar' : ( BuildContext context ) => AvatarPage(),
      },
      //home: HomePage()
    );
  }
}