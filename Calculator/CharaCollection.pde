class CharaCollection {
  ArrayList<Chara> charas;
  ArrayList<Chara> result;
  int cursor;
  int ledIndex;
  int ledSize;
  int x;
  int y;

  CharaCollection(int xCor, int yCor) {
    cursor = 0;
    ledIndex = 0;
    ledSize = 16;
    x = xCor;
    y = yCor;
    charas = new ArrayList<Chara>();
    result = new ArrayList<Chara>();
  }
  //Expression getExpTree() {
  //}
  //void calcExpTree() {
  //  result = getExpTree().getValue();
  //}
  void print() {
    if (charas.size() < ledSize) {
      int offset = ledSize - charas.size();
      for (int i = 0; i < charas.size(); i++) {
        charas.get(i).print(x+(offset+i)*13, 42);
      }
    } else {
      for (int i = 0; i < 16; i++) {
        charas.get(i+ledIndex).print(x+(i)*13, 42);
      }
    }
  }
  void cursorLeft() {
    if (charas.size() <= 16 && 0 == cursor) return; // if at end of bounds, do nithing
    if (cursor + ledIndex == 0) return; //if at end of bounds, do nothing
    if (cursor == 0) {
      ledIndex--;
    } else {
      cursor--;
    }
  }
  void cursorRight() {
    if (charas.size() < 16 && charas.size() == cursor) return; // if at end of bounds, do nothing
    if (cursor + ledIndex > charas.size()) return; //if at end of bounds, do nothing
    if (cursor == 16 && ledIndex + cursor < charas.size()) {
      ledIndex++;
    } else if (cursor != 16) {
      cursor++;
    }
  }
}
