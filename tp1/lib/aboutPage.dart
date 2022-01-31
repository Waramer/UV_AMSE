import 'package:flutter/cupertino.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text(
      'About Page',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

}