import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 100,
      width: 300,
      color: Colors.purple,
      child: Center(
        child: Text(
          "Hello World",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.combine(
                [TextDecoration.underline, TextDecoration.overline]),
            decorationThickness: 2.0,
            decorationColor: Colors.deepOrange,
            decorationStyle: TextDecorationStyle.wavy,
            letterSpacing: 1.0,
            wordSpacing: 8.0,
            shadows: const [
              Shadow(
                  color: Colors.blueAccent,
                  blurRadius: 2.0,
                  offset: Offset(4, 1))
            ],
            // foreground: Paint()
            //   ..color = Colors.black
            //   ..strokeWidth = 2.0
            //   ..style = PaintingStyle.stroke
          ),
          textAlign: TextAlign.justify,
          textDirection: TextDirection.ltr,
          // softWrap: false,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
