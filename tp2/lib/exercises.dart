import 'package:flutter/material.dart';

class Exercise {
  final String title;
  final String number;
  const Exercise(this.title, this.number);
}

const List<Exercise> exercises = [
  Exercise("Simple image", "1"),
  Exercise("Transformer une image", "2a"),
  Exercise("Animer une image", "2b"),
  Exercise("Affichage d'une tuile", "4"),
  Exercise("Plateau de tuiles", "5a"),
  Exercise("Image découpée", "5b"),
  Exercise("Plateau variable", "5c"),
  Exercise("Animer deux tuiles", "6a"),
  Exercise("Animer une plateau", "6b"),
  Exercise("Tacquin", "7"),
];

class ExercisePage extends StatefulWidget {
  const ExercisePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}