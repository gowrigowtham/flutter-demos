import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    /*return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        // shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        children: const [
          CircleAvatar(
            maxRadius: 60,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 50,
            ),
          ),
          Text(
            "Flutter Language",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );*/
    /* return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, position) {
          return Card(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                position.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
    );*/
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, position) {
            return Card(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('List Items: $position'),
              ),
            );
          },
          separatorBuilder: (context, position) {
            return Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Separator $position',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
            /* return Divider(
              height: 1,
              color: Colors.grey,
              thickness: 2.0,
            );*/
          },
          itemCount: 20),
    );
  }
}
