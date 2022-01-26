// Ex1

import 'dart:io';

void main() {
  stdout.write("What's your name? ");
  String name = stdin.readLineSync() as String;

  print("Hi, $name! What is your age?");
  int age = int.parse(stdin.readLineSync() as String);

  int yearsToHunderd = 100 - age;
  print("$name, You have $yearsToHunderd years to be 100");
}
