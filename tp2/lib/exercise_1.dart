import 'package:flutter/material.dart';

class Exercise1 extends StatefulWidget {
  const Exercise1({Key? key,}) : super(key: key);
  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  
  @override
  Widget build(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: cWidth*0.9,
        height: cWidth*0.9,
        child: Center(
          child: Image.asset('../assets/thewitcher3.png'),
        ),
      ),
    );
  }
}