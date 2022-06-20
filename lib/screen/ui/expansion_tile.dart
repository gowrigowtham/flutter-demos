import 'package:flutter/material.dart';

class ExpansionWidget extends StatefulWidget {
  const ExpansionWidget({Key? key}) : super(key: key);

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text('See More'),
      children: [
        ListTile(
          title: Text('List1'),
        ),
        ListTile(
          title: Text('List2'),
        ),
        ListTile(
          title: Text('List3'),
        ),
        ListTile(
          title: Text('List4'),
        ),
      ],
    );
  }
}
