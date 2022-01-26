// Ex8

import "dart:io";

import 'dart:math';

void main() {

  final random = Random();
  int player = 0;
  int ia = 0;

  while (ia != 3 && player != 3){

    stdout.write("Choose R, P or S : ");
    String choice_s = stdin.readLineSync() as String;
    int choice = 0;
    if (choice_s == "P"){
      choice = 1;
    }
    if (choice_s == "S"){
      choice = 2;
    }

    int ia_choice = random.nextInt(3);
    if (ia_choice==0){print("IA chose R");}
    if (ia_choice==1){print("IA chose P");}
    if (ia_choice==2){print("IA chose S");}

    if (ia_choice != choice){
      if ((ia_choice+1)%3 == choice){
        player = player + 1;
      }
      else {
        ia = ia + 1;
      }
    }
  }
  if (player == 3){
    print("YOU WIN");
  }
  else {
    print("YOU LOSE");
  }
}