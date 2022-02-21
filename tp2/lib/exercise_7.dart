import 'package:flutter/material.dart';
import 'dart:math' as math;

class Exercise7 extends StatefulWidget {
  const Exercise7({Key? key,}) : super(key: key);
  @override
  State<Exercise7> createState() => _Exercise7State();
}
class _Exercise7State extends State<Exercise7> {
  bool inGame = false;
  bool gameWon = false;
  int nbCoup = 0;
  int nbDiv = 2;
  int nbMix = 1;
  int tileActive = 0;
  int lastTileActive = 0;
  String image = '../assets/thewitcher3.png';
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    updateTiles();
    if (isGameWon() && inGame){
      gameWon = true;
    }
    else if (!inGame) {
      gameWon = false;
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          taquinUpperAppBar(),
          Expanded(child: Center(child: taquinPlayground())),
        ],
      ),
      floatingActionButton: taquinBottomButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: taquinBottomAppBar(),
    );
  }
  //=============== TAQUIN FUNCTIONS/ACTIONS ===============//
  void setGame(){
    inGame = inGame ? false : true; 
    if (inGame){
      tileActive = math.Random().nextInt(nbDiv*nbDiv);
      mixTiles();
    }
    else{
      nbCoup = 0;
    }
  }
  void updateTiles(){
    int nbTiles = (nbDiv*nbDiv).toInt();
    if (tiles.isEmpty || tiles.length!=nbTiles){
      tiles = [];
      for (int i = 0; i<nbDiv; i++){
        for (int j = 0; j<nbDiv; j++){
          tiles.add(
            Tile(
              image,
              Alignment(-1+2*j/(nbDiv-1), -1+2*i/(nbDiv-1)),
              1/nbDiv,
              0,
            )
          );
        }
      }
    }
    for(int i=0 ; i<nbTiles ; i++){
      if (i == tileActive) {
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
    int nbDivInt = nbDiv.toInt();
    if (i == tileActive+1 && tileActive%nbDivInt != nbDivInt-1) {
      return true;
    }
    else if (i == tileActive-1 && tileActive%nbDivInt != 0) {
      return true;
    }
    else if (i == tileActive+nbDivInt && tileActive <= nbDivInt*(nbDivInt-1)-1 ) {
      return true;
    }
    else if (i == tileActive-nbDivInt && tileActive >= nbDivInt) {
      return true;
    }
    return false;
  }
  void exchangeTiles(int index){
    if (tiles[index].status==1){
      Tile tileTemp = tiles[tileActive];
      tiles[tileActive] = tiles[index];
      tiles[index] = tileTemp;
    }
  }
  void tileTap(int index){
    if (tiles[index].status == 1){
      exchangeTiles(index);
      lastTileActive = tileActive;
      tileActive = index;
      nbCoup++;
    }
  }
  bool isGameWon(){
    int index = 0;
    for (int i = 0; i<nbDiv; i++){
      for (int j = 0; j<nbDiv; j++){
        if (tiles[index].alignment != Alignment(-1+2*j/(nbDiv-1), -1+2*i/(nbDiv-1))){
          return false;
        }
        index++;
      }
    }
    return true;
  }
  void mixTiles(){
    tiles = [];
    updateTiles();
    int toMix = nbMix * 10 * tiles.length;
    int lastTile = -1;
    while(toMix!=0){
      updateTiles();
      int nextTile = math.Random().nextInt(nbDiv*nbDiv);
      if(isNeightboor(nextTile) && nextTile!=lastTile){
        exchangeTiles(nextTile);
        tileActive = nextTile;
        toMix--;
      }
    }
    lastTileActive = tileActive;
    if (isGameWon()){
      mixTiles();
    }
  }
  void goToImageSelector(BuildContext context) async {
    String newImage = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImageSelector())
    );
    setState(() {
      image = newImage;
    });
  }
  void cancelLastMove(){
    if ((lastTileActive != tileActive)&&(inGame)&&(!gameWon)){
      exchangeTiles(lastTileActive);
      tileActive = lastTileActive;
      nbCoup --;
    }
  }

  //=============== TAQUIN UPPER APP BAR WIDGET ===============//
  Widget taquinUpperAppBar(){
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color.fromARGB(255,70,70,70)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Coups effectués : ", 
            style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)
          ),
          Container(
            width: 60,
            height: 30,
            decoration: BoxDecoration(
              color:const Color.fromARGB(255,40,40,40),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Text(
              nbCoup.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),
            )),
          ),
          const SizedBox(width:8),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: ((lastTileActive != tileActive)&&(inGame)&&(!gameWon)) ? Colors.red.shade900 : Colors.grey.shade800),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Icon(Icons.arrow_back_rounded,color: Colors.white,),
                  Text(" Annuler",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
                ]),
              ),
              onPressed: (){
                setState(() {
                  cancelLastMove();
                });
              },
            ),
        ],
      ),
    );
  }
  
  //=============== TAQUIN GAME PLAYGROUND WIDGET ===============//
  Widget taquinPlayground(){
    Image myImage;
    if (image.contains("http")){
      myImage = Image.network(image);
    }
    else{
      myImage = Image.asset(image);
    }
    if (inGame && !gameWon){
      return Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: nbDiv.toInt()),
            itemCount: tiles.length,
            itemBuilder: (context,index){
              return InkWell(
                child: Container(
                  padding: const EdgeInsets.all(1),
                  child: TileWidget(tile: tiles[index]),
                ),
                onTap: () {
                  setState(() {
                    tileTap(index);
                  });
                },
              );
            }
          ),
        ),
      );
    }
    else {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            myImage,
            Expanded(
              child:Center(
                child: Text(
                  gameWon ? "Gagné !":"",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold ,color: Colors.white),
                )
              )
            ),
          ],
        ),
      );
    }
  }
  //=============== TAQUIN BOTTOM BUTTON WIDGET ===============//
  Widget taquinBottomButton(){
    return FloatingActionButton.extended(
      backgroundColor: Colors.red.shade900,
      icon: inGame ? 
      (gameWon ?
        const Icon(Icons.replay,color: Colors.white,):
        const Icon(Icons.stop_rounded,color: Colors.white,)): 
        const Icon(Icons.play_arrow_rounded,color: Colors.white,),
      label: inGame ?
        (gameWon?
        const Text("REJOUER",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)):
        const Text("STOP",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white))):
        const Text("JOUER",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
      onPressed: (){
        setState(() {
          setGame();
        });
      },
    );
  }

  //=============== TAQUIN BOTTOM APP BAR WIDGETS ===============//
  Widget taquinBottomAppBar(){
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            nbDivWidget(),
            const VerticalDivider(
              thickness: 3,
              color: Color.fromARGB(255,40,40,40),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: inGame ? Colors.grey.shade800 : Colors.red.shade900),
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Icon(Icons.image,color: Colors.white,size: 50,),
                  Text("Image",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
                ]),
              ),
              onPressed: (){
                goToImageSelector(context);
              },
            ),
            const VerticalDivider(
              thickness: 3,
              color: Color.fromARGB(255,40,40,40),
            ),
            nbMixWidget(),
          ]
        ),
      ),
    );
  }
  Widget nbDivWidget(){
    return Column(
      children: [
        const Text("Divisions", style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: inGame ? Colors.grey.shade800 : Colors.red.shade900),
          child: Transform.rotate(
            angle: -math.pi/2,
            child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)
          ),
          onPressed: (){
            !inGame ? setState(() {
              nbDiv += 1;
              if (nbDiv == 11){
                nbDiv = 10 ;
              }
            }) : {};
          },
        ),
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color:const Color.fromARGB(255,40,40,40),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(
            nbDiv.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),
          )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: inGame ? Colors.grey.shade800 : Colors.red.shade900),
          child: Transform.rotate(
            angle: math.pi/2,
            child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)
          ),
          onPressed: (){
            !inGame ? setState(() {
              nbDiv -= 1;
              if (nbDiv == 1){
                nbDiv = 2 ;
              }
            }) : {};
          },
        ),
      ],
    );
  }
  Widget nbMixWidget(){
    return Column(
      children: [
        const Text("Mélange", style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.white)),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: inGame ? Colors.grey.shade800 : Colors.red.shade900),
          child: Transform.rotate(
            angle: -math.pi/2,
            child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)
          ),
          onPressed: (){
            !inGame ? setState(() {
              nbMix += 1;
              if (nbMix == 11){
                nbMix = 10 ;
              }
            }) : {};
          },
        ),
        Container(
          width: 60,
          height: 30,
          decoration: BoxDecoration(
            color:const Color.fromARGB(255,40,40,40),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text(
            nbMix.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold ,color: Colors.white),
          )),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: inGame ? Colors.grey.shade800 : Colors.red.shade900),
          child: Transform.rotate(
            angle: math.pi/2,
            child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)
          ),
          onPressed: (){
            !inGame ? setState(() {
              nbMix -= 1;
              if (nbMix == 0){
                nbMix = 1 ;
              }
            }) : {};
          },
        ),
      ],
    );
  }
}

//=============== TAQUIN IMAGE SELECTION WIDGET ===============//
class ImageSelector extends StatefulWidget {
  const ImageSelector({Key? key}) : super(key: key);
  @override
  State<ImageSelector> createState() => ImageSelectorState();
}
class ImageSelectorState extends State<ImageSelector>{
  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "../assets/arma.png",
      "../assets/assassin.png",
      "../assets/battlefield.png",
      "../assets/civilisation.png",
      "../assets/empire.png",
      "../assets/fallout.png",
      "../assets/halo.png",
      "../assets/kingdomcome.png",
      "../assets/masterchief.png",
      "../assets/napoleon.png",
      "../assets/rome.png",
      "../assets/ryse.png",
      "../assets/skyrim.png",
      "../assets/spacemarine.png",
      "../assets/squad.png",
      "../assets/starcraft.png",
      "../assets/thewitcher3.png",
      "../assets/viper.png",
      
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Select an image")),
      body: GridView.builder(
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: images.length + 1,
        itemBuilder: (context,index){
          if (index==0){
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: const BoxDecoration(color: Color.fromARGB(255,100,100,100)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.shuffle,size:50),
                      Text("Aléatoire"),
                    ],
                  ),
                ),
              ),
              onTap: (){
                setState(() {
                  Navigator.pop(context,images[math.Random().nextInt(images.length)]);
                });
              },
            );
          }
          else{
            return InkWell(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(images[index-1]),
              ),
              onTap: (){
                setState(() {
                  Navigator.pop(context,images[index-1]);
                });
              },
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255,70,70,70)),
        height: 75,
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red.shade900),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.public,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(width: 10,),
              Flexible(child:Text(
                "Aléatoire en ligne",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold ,
                  color: Colors.white
                )
              )),
            ],
          ),
          onPressed: (){
            setState(() {
              Navigator.pop(context, 'https://picsum.photos/512');
            });
          }
        ),
      ),
    );
  }
}

//=============== TAQUIN TILE CLASSES ===============//
class Tile {
  String image;
  double factor;
  Alignment alignment;
  int status;
  Tile(this.image, this.alignment, this.factor, this.status);
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
  Widget tileImage(Tile tile){
    Image tileImage;
    if (tile.image.contains("http")){
      tileImage = Image.network(tile.image);
    }
    else{
      tileImage = Image.asset(tile.image);
    }
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: ClipRect(
        child: Align(
          alignment: tile.alignment,
          widthFactor: tile.factor,
          heightFactor:tile.factor,
          child: tileImage,
        ),
      ),
    );
  }
  Widget activeTile(Tile tile){
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(color: Color.fromARGB(255,255,255,255)),
      child: tileImage(tile),
    );
  }
  Widget passiveTile(Tile tile){
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(color: Color.fromARGB(0,40,40,40)),
      child: tileImage(tile),
    );
  }
  Widget semiActiveTile(Tile tile){
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(color: Color.fromARGB(255,200,50,50)),
      child: tileImage(tile),
    );
  }
}