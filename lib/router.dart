import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/index.dart';
import 'package:flutter_practice/ui/stateful_cycle/stateful_cycle.dart';

Map<String, WidgetBuilder> routers = {
  'home': (context) => Home(),
  'statefulCycle': (context) => StatefulCycle(),
};

Route<dynamic> generateRoute(RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routers[name];

  if (pageContentBuilder != null) {
    final Route route = MaterialPageRoute(
      builder: (context) {
        if (settings.arguments != null) {
          // 有参路由
          return pageContentBuilder(context, arguments: settings.arguments);
        } else {
          // 无参路由
          return pageContentBuilder(context,);
        }
      },
      settings: settings,
    );
    return route;
  }

  return MaterialPageRoute(builder: (context) => Home());

}
