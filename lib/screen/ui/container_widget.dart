import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      margin: const EdgeInsets.all(0.0),
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(0.1),
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: const DecorationImage(
          image: NetworkImage(
              'https://www.pinclipart.com/picdir/big/211-2119839_snowflakes-transparent-background-free-snowflakes-png-clipart.png'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
          //BoxShadow
        ],
        gradient: const LinearGradient(
          colors: [Colors.white, Colors.orange],
        ),
        shape: BoxShape.rectangle,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Hello World',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
