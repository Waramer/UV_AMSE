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
    name: "F/A-18C",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
  Aircraft(
    name: "F-16C",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
];

final redfor = [
  Aircraft(
    name: "Mig-29",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
  Aircraft(
    name: "Su-30",
    designer: "todo",
    year: 2000,
    description: "todo",
    iconImage: "../assets/topgun.jpg",
    schemeImage: "../assets/topgun.jpg",
    ),
];

List<Aircraft> favourites = [];