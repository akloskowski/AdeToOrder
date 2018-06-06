class CharaCollection {
  ArrayList<Chara> charas;
  ArrayList<Chara> result;
  int cursor;
  int ledIndex;
  int ledSize;
  int x = 46;
  int y = 42;

  CharaCollection() {
    cursor = 0;
    ledIndex = 0;
    ledSize = 16;
    charas = new ArrayList<Chara>();
    result = new ArrayList<Chara>();
  }
  //Expression getExpTree() {
  //}
  //void calcExpTree() {
  //  result = getExpTree().getValue();
  //}
  void print() {
    if (charas.size() <= ledSize) {
      int offset = ledSize - charas.size();
      for (int i = 0; i <= charas.size(); i++) {
        charas.get(i).print(x+(offset+i)*13, 42);
      }
    }
  }
}
