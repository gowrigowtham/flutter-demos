import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.green),
                  onPressed: () {},
                  child: const Text('Text Button')),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.3);
                        }
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Elevated Button 1')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  child: Text(
                    'Elevated Button 2',
                    style: TextStyle(color: Theme.of(context).backgroundColor),
                  )),
              const SizedBox(height: 20),
              OutlinedButton(
                  onPressed: () {}, child: const Text('Outlined Button'))
            ],
          ),
        ),
      ),
    );
  }
}
