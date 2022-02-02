class Aircraft {
  String name;
  String designer;
  int year;
  String description;
  String iconImage;
  String schemeImage;

  Aircraft({
    required this.name, 
    required this.designer, 
    required this.year, 
    required this.description, 
    required this.iconImage, 
    required this.schemeImage,
  });
}

final blufor = [
  Aircraft(
    name: "F/A-18C Hornet",
    designer: "McDonnell Douglas",
    year: 1978,
    description: "Avion de combat multirôle américain, initialement destiné à être embarqué à bord de porte-avions de l'US Navy.",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
  Aircraft(
    name: "F-16C Viper",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
];

final redfor = [
  Aircraft(
    name: "Mig-29 Fulcrum",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
  Aircraft(
    name: "Su-30 Flanker-C",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
];

List<Aircraft> favourites = [];