import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});


}
List characters =[
Character(
    name:"Panther",
    imagePath:"assets/images/Panther.png",
    description:"is a large member of the Big Cat family, native to Asia, Africa and the Americas. The Panther is not a distinct species itself but is the general name used to refer to any black coloured feline of the Big Cat family, most notably Leopards and Jaguars. ",
    colors:[Colors.orange.shade200,Colors.deepOrange.shade400],
),
  Character(
    name:"Buffalo",
    imagePath:"assets/images/Buffalo.png",
    description:"Buffalo are the largest animals found in north America and can grow to 6-7 feet long, weighing up to 2,000lbs. True buffalo only live in Asia and Africa.",
    colors:[Colors.pink.shade200,Colors.red.shade400],
  ),
];