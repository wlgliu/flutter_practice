import 'package:flutter/material.dart';

class StatefulCycle extends StatefulWidget {
  StatefulCycle({Key key}) : super(key: key);

  _StatefulCycleState createState() => _StatefulCycleState();

}

class _StatefulCycleState extends State<StatefulCycle> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget 生命周期'),
      ),
      body: Container(
        
      ),
    );
  }
}
