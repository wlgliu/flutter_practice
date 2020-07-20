/**
 * 1、进入页面，initState -> didChangeDependencies -> build
 * 2、pop页面，deactivate -> dispose
 * 3、进入下一个页面/从下个页面返回，deactivate -> build
 * 4、父组件传来的参数发生变化 didUpdateWidget -> build
 */

import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/stateful_cycle/child_widget.dart';

class StatefulCycle extends StatefulWidget {
  StatefulCycle({Key key}) : super(key: key);

  _StatefulCycleState createState() => _StatefulCycleState();

}

class _StatefulCycleState extends State<StatefulCycle> {
  int index = 0;

  /// 调用情况
  /// 1、进入页面时
  @override
  void initState() {
    print('initState');
    super.initState();
  }

  /// 调用情况
  /// 1、热更新时
  /// 2、父组件传来的参数发生变化时
  @override
  void didUpdateWidget(StatefulCycle oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  /// 调用情况
  /// 1、进入下一个页面时
  /// 2、返回本页面时
  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  /// 调用情况
  /// 1、页面返回时
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  /// 调用情况
  /// 1、热更新时
  @override
  void reassemble() {
    print('reassemble');
    super.reassemble();
  }

  /// 调用情况
  /// 1、首次进入页面时
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  /// 调用情况
  /// 1、首次进入页面
  /// 2、setState时
  /// 3、进入下一个页面时
  /// 4、返回本页面时
  /// 5、热更新时
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget 生命周期'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  index += 1;
                });
              }, 
              child: Text('setState $index'),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'nextPage');
              },
              child: Text('页面跳转'),
            ),

            ChildWidget(
              index: index,
              onChange: (val) {
                setState(() {
                  index = val;
                });
              },
            ),

            
          ],
        ),
      ),
    );
  }
}



