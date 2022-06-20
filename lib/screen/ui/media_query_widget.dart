import 'package:flutter/material.dart';

class MediaQueryWidget extends StatefulWidget {
  const MediaQueryWidget({Key? key}) : super(key: key);

  @override
  State<MediaQueryWidget> createState() => _MediaQueryWidgetState();
}

class _MediaQueryWidgetState extends State<MediaQueryWidget> {
  List<Widget> layoutChildren(double boxSize) {
    return [
      Container(
        width: boxSize,
        height: boxSize,
        color: Colors.deepOrange,
        alignment: Alignment.center,
        child: const Text(
          'First',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      Container(
        width: boxSize,
        height: boxSize,
        color: Colors.green,
        alignment: Alignment.center,
        child: const Text(
          'Second',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    double boxSide = size.shortestSide - 0.1;
    /* return Container(

      child: Row(
        children: [
          Container(
            width: size.width / 2,
            height: size.width / 2,
            color: Colors.yellow,
          ),
          Container(
            width: size.width / 2,
            height: size.width / 2,
            color: Colors.green,
          )
        ],
      ),
    );*/

    return Builder(builder: (context) {
      if (orientation.index == Orientation.landscape.index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: layoutChildren(boxSide),
        );
      } else {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: layoutChildren(boxSide),
        );
      }
    });
  }
}
