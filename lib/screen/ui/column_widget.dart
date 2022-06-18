import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColumnWidget extends StatefulWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.deepOrange,
            margin: EdgeInsets.all(5.0),
            child: Center(child: Text('Android')),
          ),
          Container(
            height: 80,
            width: 80,
            color: Colors.deepOrange,
            margin: EdgeInsets.all(5.0),
            child: Center(child: Text('IOS')),
          ),
          Container(
            height: 80,
            width: 80,
            color: Colors.deepOrange,
            margin: EdgeInsets.all(5.0),
            child: Center(child: Text('Web ')),
          ),
        ],
      ),
    );
  }
}
