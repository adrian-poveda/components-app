import 'package:components_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:components_app/src/pages/alert_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        return MaterialPageRoute(
          builder: (BuildContext context ) => AlertPage()
        );
      },
      //home: HomePage()
    );
  }
}