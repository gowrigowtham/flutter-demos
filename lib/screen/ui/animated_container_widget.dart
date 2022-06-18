import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(9);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                final random = Random();

                // random dimension generator
                _width = random.nextInt(100).toDouble();
                _height = random.nextInt(100).toDouble();

                // random color generator
                _color = Color.fromRGBO(
                  random.nextInt(150),
                  random.nextInt(150),
                  random.nextInt(150),
                  1,
                );
                _borderRadius =
                    BorderRadius.circular(random.nextInt(55).toDouble());
              });
            },
          ),
        ],
      ),
    );
  }
}
