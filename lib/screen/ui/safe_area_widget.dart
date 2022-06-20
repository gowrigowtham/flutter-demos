import 'package:flutter/material.dart';

class SafeAreaWidget extends StatefulWidget {
  const SafeAreaWidget({Key? key}) : super(key: key);

  @override
  State<SafeAreaWidget> createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).viewPadding;
    /* return const Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        left: true,
        top: true,
        right: true,
        bottom: true,
        minimum: EdgeInsets.all(16.0),
        child: Text(
            'My Widget: This is my widget. It has some content that I don\'t want '
            'blocked by certain manufacturers who add notches, holes, and round corners.'),
      ),
    );*/
    /*return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        minimum: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 200,
            width: 500,
            color: Colors.orange,
            child: const Center(
              child: Text(
                'Flutter',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30),
              ),
            ),
          ),
        ),
      ),
    );*/
    return Padding(
      padding: devicePadding,
      child: Center(
        child: Container(
          height: 200,
          width: 500,
          color: Colors.green,
          child: const Center(
            child: Text(
              'Flutter',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
