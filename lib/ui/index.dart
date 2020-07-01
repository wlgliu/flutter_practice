import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  List contentList = [
    {
      'text': 'StatefulWidget 生命周期',
      'router': 'statefulCycle',
    }, 
    {
      'text': '生命周期',
      'router': 'statefulCycle',
    }, 
    
  ]; 
  ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 实践'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: contentList.length,
          itemBuilder: (BuildContext context, int index) => Container(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print('${contentList[index]['text']}');

                Navigator.pushNamed(context, contentList[index]['router']);
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment(-1, 0),
                color: index % 2 != 0 ? Colors.grey[300] : Colors.white,
                child: Text('${contentList[index]['text']}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
