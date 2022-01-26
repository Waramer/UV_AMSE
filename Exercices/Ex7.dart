// Ex7

void main(){
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  List<int> b = [];
  for (int nb in a){
    if (nb%2 == 0){
      b.add(nb);
    }
  }
  print(b);
}