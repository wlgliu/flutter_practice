import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/index.dart';
import 'package:flutter_practice/ui/stateManage/stateManage.dart';
import 'package:flutter_practice/ui/stateful_cycle/next_page.dart';
import 'package:flutter_practice/ui/stateful_cycle/stateful_cycle.dart';
import 'package:flutter_practice/ui/video_play/video_play.dart';
import 'package:flutter_practice/ui/video_play_chewie/video_play_chewie.dart';

Map<String, WidgetBuilder> routers = {
  'home': (context) => Home(),

  // 生命周期
  'statefulCycle': (context) => StatefulCycle(),
  'nextPage': (context) => NextPage(),
  'stateManage': (context) => StateManage(),
  'videoPlay': (context) => VideoPlay(),
  'videoPlayChewie': (context) => VideoPlayChewie(),

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
