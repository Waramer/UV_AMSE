import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "A propos\n",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              "Cette application est ma première réalisée en utilisant Flutter et le langage Dart.\n Elle constitue une petite encyclopédie d'avions de chasse en les répertoriant dans les catégories BLUFOR (i.e. 'Occidantal') et REDFOR (i.e.'Orientaux').\nIl est possible de mettre des aviosn en favoris et ces derniers seront tous affichés dans le menu 'Favourites'",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
            Text(
              "\nDéveloppeur : Quentin Delezenne",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}