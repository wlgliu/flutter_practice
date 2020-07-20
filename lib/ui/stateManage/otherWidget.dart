import 'package:flutter/material.dart';

class StateManage extends StatefulWidget {
  StateManage({Key key}) : super();

  _StateManageState createState() => _StateManageState();
}

class _StateManageState extends State<StateManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('其他组件'),
      ),
      body: Container(),
    );
  }
}
