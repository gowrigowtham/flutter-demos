import 'package:flutter/material.dart';

class SliverWidget extends StatefulWidget {
  const SliverWidget({Key? key}) : super(key: key);

  @override
  State<SliverWidget> createState() => _SliverWidgetState();
}

class _SliverWidgetState extends State<SliverWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            title: Text('Flutter'),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('MyApp'),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                for (var i = 0; i < 30; i++)
                  ListTile(
                    title: Text('List Items: $i'),
                  ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Item $index",
                      style: const TextStyle(fontSize: 25),
                    ),
                  );
                },
                childCount: 20,
              )),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  height: 20,
                  color: Colors.amber[300],
                  alignment: Alignment.center,
                  child: Text(index.toString()),
                );
              },
              childCount: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 2.0),
          ),
        ],
      ),
    );
  }
}
