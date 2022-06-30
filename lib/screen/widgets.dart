import 'package:flutter/material.dart';
import 'package:googlemapdemo/screen/ui/body.dart';

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({Key? key}) : super(key: key);

  @override
  State<WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Widgets Demo'),
      // ),
      body: Body(),
    );
  }
}
