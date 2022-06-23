import 'package:flutter/material.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(30.0),
        height: 300,
        width: 500,
        color: Colors.yellow,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          spacing: 20,
          runSpacing: 30,
          children: [
            MyWidget('A'),
            MyWidget('B'),
            MyWidget('C'),
            MyWidget('D'),
            MyWidget('E'),
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget(this.value, {Key? key}) : super(key: key);
  String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 80,
      width: 80,
      color: Colors.green,
      child: Center(
          child: Text(
        value,
        style: const TextStyle(
            fontSize: 25, color: Colors.red, fontWeight: FontWeight.w700),
      )),
    );
  }
}
