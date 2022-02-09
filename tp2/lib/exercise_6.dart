import 'package:flutter/material.dart';
import 'dart:math';

class Exercise6a extends StatefulWidget {
  const Exercise6a({Key? key,}) : super(key: key);
  @override
  State<Exercise6a> createState() => _Exercise6aState();
}

class _Exercise6aState extends State<Exercise6a> {
  List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(tile: Tile.randomColor(),));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.sentiment_very_satisfied,
        ),
        onPressed: swapTiles,
        backgroundColor: Colors.red.shade900,
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class Tile {
  Color? color;
  Tile(this.color);
  Tile.randomColor() {
    color = Color.fromARGB(
        255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({Key? key, required this.tile}) : super(key: key);
  final Tile tile;
  
  @override
  Widget build(BuildContext context) {
    return coloredBox();
  }

  Widget coloredBox() {
    return Container(
      color: tile.color,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      )
    );
  }
}
//---------------------------------------------------

class Exercise6b extends StatefulWidget {
  const Exercise6b({Key? key,}) : super(key: key);
  @override
  State<Exercise6b> createState() => _Exercise6bState();
}

class _Exercise6bState extends State<Exercise6b> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Exercice 6b"),
    );
  }
}