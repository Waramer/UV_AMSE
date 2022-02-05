class Aircraft {
  String name;
  String designer;
  int year;
  String description;
  String iconImage;

  Aircraft({
    required this.name, 
    required this.designer, 
    required this.year, 
    required this.description, 
    required this.iconImage,
  });
}

final blufor = [
  Aircraft(
    name:"Rafale",
    designer: "Dassault Aviation",
    year: 2002,
    description: "Avion multirôle avec une adaptation marine pour lesforces aériennes et aéronavales françaises.",
    iconImage: "../assets/rafale.jpg",
  ),
  Aircraft(
    name:"Mirage-2000",
    designer: "Dassault Aviation",
    year: 1984,
    description: "Chasseur français destiné à l'interception et à la protection du territoire, ayant une variante spécialisée dans l'attaque au sol.",
    iconImage: "../assets/mirage.jpg",
  ),
  Aircraft(
    name:"F-14 Tomcat",
    designer: "Grumman",
    year: 1974,
    description: "Chasseur américain embarqué, dont la particularité était de posséder des ailes à géométrie variable, et était destiné à protéger la flotte d'attaques aériennes.",
    iconImage: "../assets/tomcat.jpg",
  ),
  Aircraft(
    name:"F-15 Eagle",
    designer: "McDonnell Douglas",
    year: 1976,
    description: "Chasseur américain dit de tout temps de supériorité aérienne et possédant de nombreuses varaintes pour le combat aérien ou l'attaque au sol.",
    iconImage: "../assets/eagle.jpg",
  ),
  Aircraft(
    name: "F-16 Falcon",
    designer: "Lockheed Martin",
    year: 1978,
    description: "Avion de combat américain multirôle et largement exporté partout dans le monde.",
    iconImage: "../assets/falcon.jpg",
  ),
  Aircraft(
    name: "F/A-18 Hornet",
    designer: "McDonnell Douglas",
    year: 1983,
    description: "Avion de combat multirôle américain, initialement destiné à être embarqué à bord de porte-avions de l'US Navy.",
    iconImage: "../assets/hornet.jpg",
    ),
  Aircraft(
    name:"F-22 Raptor",
    designer: "Lockheed Martin",
    year: 2005,
    description: "Avion de chasse furtif américain destiné à protéger le territoire américain et à garantir la supériorité aérienne.",
    iconImage: "../assets/falcon.jpg",
  ),
  Aircraft(
    name:"F-35 Lightning II",
    designer: "Lockheed Martin",
    year: 2015,
    description: "Chasseur multirôle américain doté d'une version navalisée et d'une version avec un système de Vertical Take-Off and Landing.",
    iconImage: "../assets/lightning2.jpg",
  ),
  Aircraft(
    name:"Eurofitgher Typhoon",
    designer: "Eurofighter GmbH",
    year: 2004,
    description: "Avion de combat multirôle européen ayant été développé par plusieurs pays en concurrence au Rafale français.",
    iconImage: "../assets/typhoon.jpg",
  ),
  Aircraft(
    name:"JAS 39 Gripen",
    designer: "Saab",
    year: 1996,
    description: "Avion multirôle suédois ayant la particularité de pouvoir opérer depuis des routes et ne nécessitant pas de piste.",
    iconImage: "../assets/gripen.jpg",
  ),
];

final redfor = [
  Aircraft(
    name: "Mig-29 Fulcrum",
    designer: "Mikoyan-Gourevitch",
    year: 1983,
    description: "Chasseur soviétique de suprématie aérienne et exporté dans de nombreux pays.",
    iconImage: "../assets/fulcrum.jpg",
    ),
  Aircraft(
    name:"Mig-31 Fowhound",
    designer: "Mikoyan-Gourevitch",
    year: 1981,
    description: "Intercepeur soviétique ayant des performance impressionnantes en terme de vitesse et d'altitude de croisière.",
    iconImage: "../assets/foxhound.jpg",
  ),
  Aircraft(
    name: "Su-30 Flanker-C",
    designer: "Soukhoï",
    year: 1996,
    description: "Avion de combat russe multirôle.",
    iconImage: "../assets/flankerC.jpg",
  ),
  Aircraft(
    name:"Su-33 Flancker-D",
    designer: "Soukhoï",
    year: 1995,
    description: "Chasseur russe embarqué dérivé des autres modèles Flanker.",
    iconImage: "../assets/flankerD.jpg",
  ),
  Aircraft(
    name:"Su-34 Fullback",
    designer: "Soukhoï",
    year: 2013,
    description: "Bombardier tactique russe ayant, entre autres, des capacités de lutte antinavire",
    iconImage: "../assets/fullback.jpg",
  ),
  Aircraft(
    name:"Su-57 Felon",
    designer: "Soukhoï",
    year: 2020,
    description: "Chasseur furtif multirôle russe de dernière génération.",
    iconImage: "../assets/felon.jpg",
  ),
  Aircraft(
    name:"JF-17 Thunder",
    designer: "Chengdu",
    year: 2010,
    description: "Avion multirôle conçu en partenariat entre la Chine et le Pakistan.",
    iconImage: "../assets/thunder.jpg",
  ),
  Aircraft(
    name:"J-10 Vigorous Dragon",
    designer: "Chengdu",
    year: 2005,
    description: "Avion multirôle chinois conçu pour les forces chinoises et possédant plusieurs variantes.",
    iconImage: "../assets/vigorousdragon.jpg",
  ),
];

List<Aircraft> favourites = [];