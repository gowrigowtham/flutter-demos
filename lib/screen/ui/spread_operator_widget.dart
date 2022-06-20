import 'package:flutter/material.dart';

class SpreadOperatorWidget extends StatefulWidget {
  const SpreadOperatorWidget({Key? key}) : super(key: key);

  @override
  State<SpreadOperatorWidget> createState() => _SpreadOperatorWidgetState();
}

class _SpreadOperatorWidgetState extends State<SpreadOperatorWidget> {
  List<Widget> imageList = [
    Image.asset('assets/yoga.png', height: 100),
    Image.asset('assets/yoga.png', height: 100),
    Image.asset('assets/yoga.png', height: 100),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/yoga.png', height: 100),
        // Column(
        //   children: imageList,
        // )
        ...imageList
      ],
    );
  }
}
