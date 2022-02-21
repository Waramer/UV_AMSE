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
        colorScheme: ColorScheme.highContrastDark(
          surface: Colors.red.shade900,
        ),
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
    final double cWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top:5,bottom:5),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red.shade900,
        icon: const Icon(Icons.play_arrow_rounded,color: Colors.white,),
        label: const Text("Jouer",style: TextStyle(color: Colors.white),),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ExercisePage(title: "Taquin")),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(height: cWidth*0.10),
      ),
    );
  }
}
