import 'package:flutter/material.dart';
import 'aircrafts.dart';

class BluforPage extends StatefulWidget {
  const BluforPage({ Key? key }) : super(key: key);

  @override
  _BluforPageState createState() => _BluforPageState();
}

class _BluforPageState extends State<BluforPage> {
  
  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: blufor.length,
      itemBuilder: (context, i) {
        return _buildRow(blufor[i]);
      },
    );
  }

  Widget _buildRow(Aircraft aircraft) {
    final alreadySaved = favourites.contains(aircraft);
    return ListTile(
      leading: Image(image: AssetImage(aircraft.iconImage)),
      title: Text(
        aircraft.name,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
        semanticLabel: alreadySaved ? 'Remove from Saved' : 'Save',
      ),
      onTap: (){
        setState(() {
          if (alreadySaved){
            favourites.remove(aircraft);
          }
          else{
            favourites.add(aircraft);
          }
        });
      },
    );
  }
}