import 'package:flutter/material.dart';

class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({Key? key}) : super(key: key);

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 100,
      width: 300,
      color: Colors.green,
      padding: const EdgeInsets.all(10.0),
      child: const Center(
        child: FittedBox(
          child: Text(
            "Fitted Widget",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 60, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
