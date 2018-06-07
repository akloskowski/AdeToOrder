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
  void calcExpTree() {
    result.clear();
    double val = getExpTree().getValue();
    //double val = -0.0000000000000093249829;
    println(val);
    String valString = String.valueOf(val);
    println(valString);

    //scientific notation
    int indE = valString.indexOf("E");
    if (indE != -1) {
      valString = valString.substring(0, 15-valString.length()+indE) + valString.substring(indE);
    }

    for (int i = 0; i < 16 && i < valString.length(); i ++) {
      String id = valString.substring(i, i+1);
      if (id.equals(".")) id = "decimal";
      if (id.equals("-")) id = "inverse";
      result.add(new Chara(id));
    }
  }
  void print() {
    //print user input
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

    //print previous result
    if (result.size() < ledSize) {
      int offset = ledSize - result.size();
      for (int i = 0; i < result.size(); i++) {
        result.get(i).print(x+(offset+i)*13, 65);
      }
    } else {
      for (int i = 0; i < 16; i++) {
        result.get(i).print(x+(i)*13, 65);
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
