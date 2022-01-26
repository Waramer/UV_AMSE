// Ex2

import 'dart:io';

void main() {
  stdout.write("Enter a number : ");
  int number = int.parse(stdin.readLineSync() as String);
  if (number % 2 == 0) {
    print("Your number is even.");
  }
  else {
    print("Your number is odd.");
  }
}
