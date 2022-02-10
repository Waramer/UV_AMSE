import 'package:flutter/material.dart';
import 'package:tp2/exercise_1.dart';
import 'package:tp2/exercise_2.dart';
import 'package:tp2/exercise_4.dart';
import 'package:tp2/exercise_5.dart';
import 'package:tp2/exercise_6a.dart';
import 'package:tp2/exercise_6b.dart';
import 'package:tp2/exercise_7.dart';

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
  Exercise("Animer un plateau", "6b"),
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
    Exercise ex = exercises.firstWhere((e) => e.title == widget.title);
    Widget exercise;
    switch (ex.number) {
      case "1":
        exercise = Exercise1();
        break;
      case "2a":
        exercise = Exercise2a();
        break;
      case "2b":
        exercise = Exercise2b();
        break;
      case "4":
        exercise = Exercise4();
        break;
      case "5a":
        exercise = Exercise5a();
        break;
      case "5b":
        exercise = Exercise5b();
        break;
      case "5c":
        exercise = Exercise5c();
        break;
      case "6a":
        exercise = Exercise6a();
        break;
      case "6b":
        exercise = Exercise6b();
        break;
      case "7":
        exercise = Exercise7();
        break;
      default:
        exercise = const Center(child:Text("No Exercise"),);
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: exercise,
    );
  }
}