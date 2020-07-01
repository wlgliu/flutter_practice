import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/index.dart';
import 'package:flutter_practice/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      navigatorObservers: [
        RouteObserver(),
      ],
      home: Home(),
    );
  }
}

class RouteObserver extends NavigatorObserver {

  @override
  void didPush(Route route, Route previousRoute) {
    // ignore: unused_local_variable
    String fromPage;
    // ignore: unused_local_variable
    String currentPage;
    try {
      fromPage = previousRoute.settings.name;
    } catch(e) {
      print('获取上一页的路由出错： $e');
    }
    
    try {
      currentPage = route.settings.name;
    } catch(e) {
      print('获取当前页的路由出错： $e');
    }
    
    super.didPush(route, previousRoute);
  }

  
}
