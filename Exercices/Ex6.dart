// Ex6

import 'dart:io';

void main() {
  
  stdout.write("Please give a word: ");
  String input = stdin.readLineSync() as String;
  String revInput = input.split('').reversed.join('');
  
  if (input == revInput) {
    print("The word is palindrome");
  }
  else {
    print("The word is not a palindrome");
  }
}