import 'package:flutter/material.dart';

class ChildWidget extends StatefulWidget {
  final int index;
  final ValueChanged onChange;
  ChildWidget({Key key, this.index, this.onChange}) : super(key: key);

  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int _index;

  @override
  void initState() {
    _index = widget.index;
    
    super.initState();
  }


  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    print('childwidget didUpdateWidget');
    _index = widget.index;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('childwidget build');
    return Container(
      child: Column(
        children: <Widget>[
          Text('${widget.index}'),

          RaisedButton(
            onPressed: () {
              setState(() {
                _index = _index + 1;
              });
              widget.onChange(_index);
            },
            child: Text('向父组件传递参数$_index'),
          ),
        ],
      ),
    );
  }
}
