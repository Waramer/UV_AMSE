// Ex4

import "dart:io";

void main(){
  stdout.write("Enter a number : ");
  int number = int.parse(stdin.readLineSync() as String);
  for (int nb = 1 ; nb <= number ; nb++){
    if (number%nb == 0){
      print("$nb en est un diviseur");
    }
  }
}