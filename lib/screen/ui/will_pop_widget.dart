import 'package:flutter/material.dart';

class WillpopScopeWidget extends StatefulWidget {
  const WillpopScopeWidget({Key? key}) : super(key: key);

  @override
  State<WillpopScopeWidget> createState() => _WillpopScopeWidgetState();
}

class _WillpopScopeWidgetState extends State<WillpopScopeWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Center(),
        ),
        onWillPop: () async {
          // return false;
          final shouldPop = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Do you want to go back?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              );
            },
          );
          return shouldPop!;
        },
      ),
    );
  }
}
