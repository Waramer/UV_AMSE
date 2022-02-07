import 'package:flutter/material.dart';

class Exercise1 extends StatefulWidget {
  const Exercise1({Key? key,}) : super(key: key);
  @override
  State<Exercise1> createState() => _Exercise1State();
}

class _Exercise1State extends State<Exercise1> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Exercice 1"),
    );
  }
}