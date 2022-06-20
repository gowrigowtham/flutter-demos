import 'package:flutter/material.dart';

class InkWellWidget extends StatefulWidget {
  const InkWellWidget({Key? key}) : super(key: key);

  @override
  State<InkWellWidget> createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  Color boxColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: InkWell(
          onDoubleTap: () {
            setState(() {
              boxColor = Colors.orange;
            });
          },
          onTap: () {
            setState(() {
              boxColor = Colors.green;
            });
          },
          onLongPress: () {
            setState(() {
              boxColor = Colors.blue;
            });
          },
          child: Ink(
            height: 200,
            width: 200,
            color: boxColor,
            child: const Center(
              child: FlutterLogo(
                size: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
