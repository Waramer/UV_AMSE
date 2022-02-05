import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Quote quote = quotes[Random().nextInt(quotes.length)];

  @override
  Widget build(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            quote.text,
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: cWidth*0.1,),
          const Divider(thickness: 5.0,color: Colors.blue),
          SizedBox(height: cWidth*0.1,),
          Text(
            quote.author,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
        ]
      )
    );
  }
}

class Quote {
  String text;
  String author;
  Quote({required this.text, required this.author});
}

final List<Quote> quotes = [
  Quote(text:"Un bel avion est un avion qui vole bien.",author:"Marcel Dassault"),
  Quote(text:"Fais de ta vie un rêve, et d’un rêve, une réalité.",author:"Antoine de Saint Exupery"),
  Quote(text:"Je vole car cela libère mon esprit de la tyrannie des choses insignifiantes.",author:"Antoine de Saint-Exupéry"),
  Quote(text:"La vie moderne autorise les voyages mais ne procure pas d’aventures.",author:"Jean Mermoz"),
  Quote(text:"Dans les airs une machine cesse d’être un assemblage mécanique ; elle s’anime et exprime le tempérament du pilote.",author:"Ross Smith"),
  Quote(text:"Faites que le rêve dévore votre vie afin que la vie ne dévore pas votre rêve.",author:"Antoine de Saint Exupery"),
  Quote(text:"Une fois que vous aurez goûté au vol, vous marcherez à jamais les yeux tournés vers le ciel, car c’est là que vous êtes allés, et c’est là que toujours vous désirerez ardemment retourner.",author:"Léonard de Vinci"),
  Quote(text:"Ce qui importe, ce n’est pas d’arriver, mais d’aller vers.",author:"Antoine de Saint Exupery"),
  Quote(text:"On n'a rien donné tant qu'on n'a pas tout donné.",author:"Georges Guynemer"),
  Quote(text:"Faire face.",author:"Georges Guynemer"),
];