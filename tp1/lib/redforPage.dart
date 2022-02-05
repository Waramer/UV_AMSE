import 'package:flutter/material.dart';
import 'aircrafts.dart';

class RedforPage extends StatefulWidget {
  const RedforPage({ Key? key }) : super(key: key);

  @override
  _RedforPageState createState() => _RedforPageState();
}

class _RedforPageState extends State<RedforPage> {
  
  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: redfor.length,
      itemBuilder: (context, i) {
        return _buildRow(redfor[i]);
      },
    );
  }

  Widget _buildRow(Aircraft aircraft) {
    final alreadySaved = favourites.contains(aircraft);
    final double cWidth = MediaQuery.of(context).size.width;
    const _myTitleStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
    const _mySubtitleStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.normal);
    const _myTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
    
    return Card(
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: cWidth*0.25,
                width: cWidth*0.25,
                child: Image.asset(aircraft.iconImage,fit: BoxFit.fill,),
              ),
              SizedBox(width: cWidth*0.02,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aircraft.name, 
                      style: _myTitleStyle,
                    ),
                    Text(
                      aircraft.designer, 
                      style: _mySubtitleStyle,
                    ),
                    Text(
                      aircraft.year.toString(), 
                      style: _mySubtitleStyle,
                    ),
                    Text(
                      aircraft.description, 
                      style: _myTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        trailing: 
          Icon(
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
      ),
    );
  }
}