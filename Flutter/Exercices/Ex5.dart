// Ex5

void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  Set<int> c = {};
  for (int nba in a){
    for (int nbb in b){
      if (nba == nbb){
        c.add(nba);
      }
    }
  }
  print(c);
}