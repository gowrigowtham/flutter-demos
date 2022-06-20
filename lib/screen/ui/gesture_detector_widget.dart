import 'package:flutter/material.dart';

class GestureDectectorWidget extends StatefulWidget {
  const GestureDectectorWidget({Key? key}) : super(key: key);

  @override
  State<GestureDectectorWidget> createState() => _GestureDectectorWidgetState();
}

class _GestureDectectorWidgetState extends State<GestureDectectorWidget> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _counter += 1;
          });
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            height: 100,
            width: 100,
            color: Colors.purple,
            child: Center(
                child: Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
