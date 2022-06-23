import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowWidget extends StatefulWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.ltr,
          // verticalDirection: VerticalDirection.down,
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Nature places",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontFamily: 'Raceway',
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Build apps on six different platforms from a single codebase with Flutter",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
                textDirection: TextDirection.ltr,
              ),
            )
          ],
        ),
      ),
    );
  }
}
