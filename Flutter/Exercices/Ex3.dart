// Ex3

import "dart:io";

void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  for (int nb in a) {
    if (nb < 5){
      print("$nb is in the list.");
    }
  }
}