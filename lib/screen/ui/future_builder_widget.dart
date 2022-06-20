import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({Key? key}) : super(key: key);

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

Future<String> getData() async {
  await Future.delayed(const Duration(seconds: 1));
  return 'Success';
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
              }
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(child: Text(snapshot.error.toString())),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(snapshot.data.toString()),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: const Text('Refresh'))
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
