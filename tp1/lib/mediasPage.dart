import 'package:flutter/material.dart';

class MediasPage extends StatelessWidget {
  const MediasPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mediasList.length,
      itemBuilder: (context,index){
        return Card(
          child: ListTile(
            leading: Image(
              image: AssetImage(mediasList[index].image),
              height: 100,
              width: 100,
            ),
            isThreeLine: true,
            title: Text(
              mediasList[index].title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            subtitle: Text(
              mediasList[index].type,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
          ),
        );
      },
    );
  }
}

class MediaModel {
  String title;
  String description;
  String type;
  String image;

  MediaModel({required this.title,required this.description,required this.type,required this.image});
}

final mediasList = [
  MediaModel(
    title: "Les Chevaliers du Ciel", 
    description: "Film français racontant l'histoire de deux pilotes de chasse se l'Armée de l'Air.",
    type: "Film", 
    image: "../res/leschevaliersduciel.jpg",
  ),
  MediaModel(
    title: "Windfighters", 
    description: "Film Coréen qui raconte l'histoire d'un pilote de chasse trop témérère qui va découvrir la réalité de la guerre.", 
    type: "Film", 
    image: "../res/windfighters.jpg",
  ),
  MediaModel(
    title: "Furtif", 
    description: "Film relatant l'histoire de pilotes d'essai et d'un nouvel appareil doté d'une intelligence artificielle qui vas avoir une défailance.", 
    type: "Film", 
    image: "../res/furtif.jpg",
  ),
  MediaModel(
    title: "TopGun", 
    description: "Film américain célèbre retraçant les début du jeune pilote Pete Michell en tant que pilot de l'aéronavale envoyé à la Navy Fighter Weapon School.", 
    type: "Film", 
    image: "../res/topgun.jpg",
  ),
  MediaModel(
    title: "ATE TopGun2Speaker", 
    description: "Ancien pilote de l'aéronautique navale et aujourd'hui pilote de ligne, 'Até' poste via sa chane YouTube des vidéo sur différents sujet de l'actualité aéronautique militaire.", 
    type: "Chaine YouTube", 
    image: "../res/ate.jpg",
  ),
  MediaModel(
    title: "DCS", 
    description: "Simulateur de combat aérien", 
    type: "Jeu", 
    image: "../res/dcs.jpg",
  ),
  MediaModel(
    title: "HAWX", 
    description: "Jeu de pilotage arcade", 
    type: "Jeu", 
    image: "../res/hawx.jpg"
  ),
  MediaModel(
    title: "Ace Combat", 
    description: "Jeu de pilotage arcade", 
    type: "Jeu", 
    image: "../res/acecombat.jpg"
  ),
];