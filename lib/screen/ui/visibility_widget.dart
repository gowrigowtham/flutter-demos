import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({Key? key}) : super(key: key);

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool switchValue = false;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 200,
      width: 200,
      child: Wrap(
        children: [
          Switch(
              value: switchValue,
              onChanged: (value) {
                switchValue = value;
                isVisible = !isVisible;
                setState(() {});
              }),
          Visibility(
            child: Image.asset('assets/yoga.png'),
            visible: isVisible,
          )
        ],
      ),
    );
  }
}
