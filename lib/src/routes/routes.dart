import 'package:flutter/material.dart';

import 'package:components_app/src/pages/alert_page.dart';
import 'package:components_app/src/pages/avatar.dart';
import 'package:components_app/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder>{
          '/' : ( BuildContext context ) => HomePage(),
          'alert' : ( BuildContext context ) => AlertPage(),
          'avatar' : ( BuildContext context ) => AvatarPage(),
  };
}