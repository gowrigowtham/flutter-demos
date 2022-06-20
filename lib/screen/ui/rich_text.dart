import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({Key? key}) : super(key: key);

  // final TapGestureRecognizer gestureRecognizer = TapGestureRecognizer()
  //   ..onTap = () {
  //     print("Clicked");
  //   };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 500,
      child: Center(
        child: RichText(
          text: TextSpan(
              text: "Don't have an Account? ",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                    text: "Register",
                    style: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('click');
                      }),
                const WidgetSpan(
                    child: Icon(Icons.arrow_back),
                    alignment: PlaceholderAlignment.middle)
              ]),
        ),
      ),
    );
  }
}
