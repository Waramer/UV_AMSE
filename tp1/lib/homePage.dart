import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Home Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}