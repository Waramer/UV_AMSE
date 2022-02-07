import 'package:flutter/material.dart';
import 'exercises.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Jeu de Tacquin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: Text(exercises[index].number),
              title: Text(exercises[index].title),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,),
              onTap:(){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => ExercisePage(title: exercises[index].title)
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
