import 'package:flutter/material.dart';

class Exercise6b extends StatefulWidget {
  const Exercise6b({Key? key,}) : super(key: key);
  @override
  State<Exercise6b> createState() => _Exercise6bState();
}

class _Exercise6bState extends State<Exercise6b> {
  int activeTilePos = 5;
  double tilesDivisions = 4.0;
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    updateTiles();
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: tilesDivisions.toInt()),
        itemCount: tiles.length,
        itemBuilder: (context,index){
          return InkWell(
            child: Container(
              padding: const EdgeInsets.all(2),
              child: TileWidget(tile: tiles[index]),
            ),
            onTap: (){
              setState(() {
                exchangeTiles(index);
              });
            },
          );
        }
      ),
    );
  }
  void updateTiles(){
    int nbTiles = (tilesDivisions*tilesDivisions).toInt();
    if (tiles.isEmpty) {
      for(int i=0 ; i<nbTiles ; i++){
        tiles.add(Tile(i.toString(),0));
      }
    }
    for(int i=0 ; i<nbTiles ; i++){
      if (i == activeTilePos) {
        tiles[i].status = 2;
      }
      else if (isNeightboor(i)) {
        tiles[i].status = 1;
      }
      else{
        tiles[i].status = 0;
      }
    }
  }
  bool isNeightboor(int i){
    int nbDiv = tilesDivisions.toInt();
    if (i == activeTilePos+1 && activeTilePos%nbDiv != 3) {
      return true;
    }
    else if (i == activeTilePos-1 && activeTilePos%nbDiv != 0) {
      return true;
    }
    else if (i == activeTilePos+nbDiv && activeTilePos <= nbDiv*(nbDiv-1)-1 ) {
      return true;
    }
    else if (i == activeTilePos-nbDiv && activeTilePos >= nbDiv) {
      return true;
    }
    return false;
  }
  void exchangeTiles(int index){
    if (tiles[index].status==1){
      Tile tileTemp = tiles[activeTilePos];
      tiles[activeTilePos] = tiles[index];
      tiles[index] = tileTemp;
      activeTilePos = index;
    }
  }
}

class Tile {
  String text;
  int status;
  Tile(this.text, this.status);
}
class TileWidget extends StatelessWidget {
  const TileWidget({Key? key, required this.tile}) : super(key: key);
  final Tile tile;
  
  @override
  Widget build(BuildContext context) {
    switch (tile.status) {
      case 1 :
        return semiActiveTile(tile);
      case 2 :
        return activeTile(tile);
      default:
        return passiveTile(tile);
    }
  }

  Widget activeTile(Tile tile){
    return Container(
      child: Center(child:Text(tile.text)),
    );
  }
  Widget passiveTile(Tile tile){
    return Container(
      decoration: const BoxDecoration(color: Color.fromARGB(255,100,100,100)),
      child: Center(child:Text(tile.text)),
    );
  }
  Widget semiActiveTile(Tile tile){
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(color: Color.fromARGB(255,200,50,50)),
      child: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255,100,100,100)),
        child: Center(child:Text(tile.text)),
      ),
    );
  }

}