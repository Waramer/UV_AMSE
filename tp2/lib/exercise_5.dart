import 'package:flutter/material.dart';

class Exercise5a extends StatefulWidget {
  const Exercise5a({Key? key,}) : super(key: key);
  @override
  State<Exercise5a> createState() => _Exercise5aState();
}

class _Exercise5aState extends State<Exercise5a> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("1")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("2")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("3")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("4")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("5")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("6")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("7")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("8")),color: Colors.red.shade900),
          Container(padding: const EdgeInsets.all(8),child: const Center(child:Text("9")),color: Colors.red.shade900),
        ],
      ),
    );
  }
}

//---------------------------------------------------

class Exercise5b extends StatefulWidget {
  const Exercise5b({Key? key,}) : super(key: key);
  @override
  State<Exercise5b> createState() => _Exercise5bState();
}

class Tile extends StatelessWidget{
  String image;
  double factor;
  Alignment alignment;
  Function()? onTap;

  Tile({Key? key, required this.alignment, required this.factor, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: factor,
          heightFactor:factor,
          child: Image.asset(image),
        ),
      ),
    );
  }
}

class _Exercise5bState extends State<Exercise5b> {
  List<Tile> tiles = [
    Tile(
      alignment: Alignment.topLeft, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.topCenter, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.topRight, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.centerLeft, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.center, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.centerRight, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.bottomLeft, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.bottomCenter, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
    Tile(
      alignment: Alignment.bottomRight, 
      factor: 1/3,
      image: '../assets/thewitcher3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        children: [
          createTileWidgetFrom(tiles[0]),
          createTileWidgetFrom(tiles[1]),
          createTileWidgetFrom(tiles[2]),
          createTileWidgetFrom(tiles[3]),
          createTileWidgetFrom(tiles[4]),
          createTileWidgetFrom(tiles[5]),
          createTileWidgetFrom(tiles[6]),
          createTileWidgetFrom(tiles[7]),
          createTileWidgetFrom(tiles[8]),
        ],
      ),
    );
  }
  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile,
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}

//---------------------------------------------------

class Exercise5c extends StatefulWidget {
  const Exercise5c({Key? key,}) : super(key: key);
  @override
  State<Exercise5c> createState() => _Exercise5cState();
}

class _Exercise5cState extends State<Exercise5c> {
  double tilesDivisions = 5.0;
  List<Tile> tiles = [];

  @override
  Widget build(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    updateTiles();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: cWidth,
            height: cWidth,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: tilesDivisions.toInt()),
              itemCount: tiles.length,
              itemBuilder: (context,index){
                return createTileWidgetFrom(tiles[index]);
              }
            ),
          ),
          Row(
            children: [
              const Text("Divisions : "),
              Expanded(
                child: Slider(
                  value: tilesDivisions,
                  min: 2,
                  max: 10,
                  divisions: 8,
                  activeColor: Colors.red.shade900,
                  thumbColor: Colors.red.shade900,
                  inactiveColor: Colors.red.shade900.withAlpha(100),
                  onChanged: (double value){
                    setState(() {
                      tilesDivisions = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void updateTiles(){
    tiles = [];
    for (int i = 0; i<tilesDivisions; i++){
      for (int j = 0; j<tilesDivisions; j++){
        tiles.add(
          Tile(
            alignment: Alignment(-1+2*j/(tilesDivisions-1), -1+2*i/(tilesDivisions-1)),
            factor: 1/tilesDivisions,
            image: '../assets/thewitcher3.png',
          )
        );
      }
    }
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(1),
        child: tile,
      ),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}