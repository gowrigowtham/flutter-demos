import 'package:flutter/material.dart';

class InteractiveViewerWidget extends StatefulWidget {
  const InteractiveViewerWidget({Key? key}) : super(key: key);

  @override
  State<InteractiveViewerWidget> createState() =>
      _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(double.infinity),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: 300,
            color: Colors.orange,
            child: const Text(
              'Flutter',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
