import 'package:flutter/material.dart';

const WHITE = "white";
const PRIMARY = "primary";
const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(255, 25, 64, 1),
  WHITE: Colors.white
};

class FlutterWidgets extends StatefulWidget {
  const FlutterWidgets({Key? key}) : super(key: key);

  @override
  State<FlutterWidgets> createState() => _FlutterWidgetsState();
}

class _FlutterWidgetsState extends State<FlutterWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      backgroundColor: myColors[PRIMARY],
      body: Body(),
    );
  }
}

_myAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      backgroundColor: myColors[WHITE],
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: myColors[PRIMARY],
              size: 32,
            )),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: myColors[PRIMARY],
              size: 32,
            ),
          ),
        )
      ],
    ),
  );
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            decoration: BoxDecoration(
              color: myColors[WHITE],
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  ),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(),
        )
      ],
    );
  }
}
