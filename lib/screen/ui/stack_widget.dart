import 'package:flutter/material.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({Key? key}) : super(key: key);

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  String url =
      "https://irs3.4sqi.net/img/user/200/21325770-GWARVMMU2R5QLN04.jpg";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Image clicked");
      },
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            color: Colors.green,
          ),
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(color: Colors.orange, spreadRadius: 5),
                  ],
                  border: Border.all(color: Colors.blue, width: 5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
