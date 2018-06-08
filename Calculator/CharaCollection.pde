class CharaCollection {
  ArrayList<Chara> charas;
  ArrayList<Chara> result;
  boolean error;
  double ans;
  int cursor;
  int ledIndex;
  int ledSize;
  int x;
  int y;

  CharaCollection(int xCor, int yCor) {
    cursor = 0;
    ledIndex = 0;
    ledSize = 16;
    ans = 0.0;
    error = false;
    x = xCor;
    y = yCor;
    charas = new ArrayList<Chara>();
    result = new ArrayList<Chara>();
  }
  Expression getExpTree() {
    return getExpTree(0, charas.size());
  }
  Expression getExpTree(int min, int max) {

    //check if empty, therefore error
    if (min - max == 0) {
      error = true;
    }
    if (error) {
      return new Float(0.0);
    }

    //check if number
    boolean isDigit = true;
    for (int i = min; i < max; i++) {
      boolean isIn = false;
      for (String s : NUMCHARAS) {
        if (s.equals(charas.get(i).id)) isIn = true;
      }
      if (!isIn) isDigit = false;
    }
    if (isDigit) {
      int decimalPoints = 0;
      int decimalIndex = -1;
      for (int i = min; i < max; i++) {
        if (charas.get(i).id == "decimal") {
          decimalPoints++;
          decimalIndex = i;
        };
      }
      if (decimalPoints > 1) {
        error = true;
        return new Float(0.0);
      } else if (decimalPoints == 1) {
      } else {
        double val = 0;
        for (int i = min; i < max; i++) {
          val += Integer.parseInt(charas.get(i).id) * pow(10, max - i - 1);
        }
        return new Float(val);
      }
    }

    //trimming begin/end parens
    if (charas.get(min).id.equals("(") && charas.get(max-1).id.equals(")")) return getExpTree(min+1, max-1);

    //search for + -
    int parenCount = 0; //for skipping through parens
    int opIndex = -1;
    for (int i = min; i < max; i++) {
      if (charas.get(i).id.equals("(")) parenCount++; //skips over sections with parentheses
      if (charas.get(i).id.equals(")")) parenCount--; 

      if (charas.get(i).id.equals("+") && parenCount == 0) opIndex = i;
      if (charas.get(i).id.equals("-") && parenCount == 0) opIndex = i;
    }
    if (parenCount != 0) { 
      error = true;
      return new Float(0.0);
    } 
    //println(opIndex);
    if (opIndex != -1) {
      if (charas.get(opIndex).id.equals("+")) return new Add(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
      if (charas.get(opIndex).id.equals("-")) return new Subtract(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
    }

    //search for * /
    parenCount = 0;
    opIndex = -1;
    for (int i = min; i < max; i++) {
      if (charas.get(i).id.equals("(")) parenCount++; //skips over sections with parentheses
      if (charas.get(i).id.equals(")")) parenCount--; 

      if (charas.get(i).id.equals("times") && parenCount == 0) opIndex = i;
      if (charas.get(i).id.equals("divide") && parenCount == 0) opIndex = i;
    }
    if (parenCount != 0) { 
      error = true;
      return new Float(0.0);
    } 
    //println(opIndex);
    if (opIndex != -1) {
      if (charas.get(opIndex).id.equals("times")) return new Multiply(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
      if (charas.get(opIndex).id.equals("divide")) return new Divide(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
    }


    //search for ^
    parenCount = 0;
    opIndex = -1;
    for (int i = min; i < max; i++) {
      if (charas.get(i).id.equals("(")) parenCount++; //skips over sections with parentheses
      if (charas.get(i).id.equals(")")) parenCount--; 

      if (charas.get(i).id.equals("exp") && parenCount == 0) opIndex = i;
    }
    if (parenCount != 0) {
      error = true;
      return new Float(0.0);
    } 
    //println(opIndex);
    if (opIndex != -1) {
      return new Power(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
    }

    //search for xroot
    parenCount = 0;
    opIndex = -1;
    for (int i = min; i < max; i++) {
      if (charas.get(i).id.equals("(")) parenCount++; //skips over sections with parentheses
      if (charas.get(i).id.equals(")")) parenCount--; 

      if (charas.get(i).id.equals("xroot") && parenCount == 0) opIndex = i;
    }
    if (parenCount != 0) {
      error = true;
      return new Float(0.0);
    } 
    println(opIndex);
    if (opIndex != -1) {
      return new Xroot(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
    }

    if (charas.get(max-1).id.equals("!")) {
      return new Factorial(getExpTree(min, max-1));
    }
    if (charas.get(max-1).id.equals("square")) {
      return new Power(getExpTree(min, max-1), new Float(2.0));
    }
    if (charas.get(max-1).id.equals("reciprocal")) {
      return new Power(getExpTree(min, max-1), new Float(-1.0));
    }
    if (charas.get(max-1).id.equals("degree")) {
      return new Multiply(getExpTree(min, max-1), new Divide(new Float(PI), new Float(180.0)));
    }

    if (charas.get(min).id.equals("log")) {
      return new Log(getExpTree(min+1, max));
    }
    if (charas.get(min).id.equals("ln")) {
      return new Ln(getExpTree(min+1, max));
    }
    if (charas.get(min).id.equals("sin")) {
      return new Sine(getExpTree(min+1, max));
    }
    if (charas.get(min).id.equals("cos")) {
      return new Cosine(getExpTree(min+1, max));
    }
    if (charas.get(min).id.equals("tan")) {
      return new Tangent(getExpTree(min+1, max));
    }
    if (charas.get(min).id.equals("arcsin")) {
      Expression e = getExpTree(min+1, max);
      //println(new Arcsin(e).getValue());
      if (e.getValue() > 1.0 || e.getValue() < -1.0) {
       error = true;
       return new Float(0.0);
      }
      return new Arcsin(e);
    }
    if (charas.get(min).id.equals("arccos")) {
      Expression e = getExpTree(min+1, max);
      if (e.getValue() > 1.0 || e.getValue() < -1.0) {
       error = true;
       return new Float(0.0);
      }
      return new Arccos(e);
    }
    if (charas.get(min).id.equals("arctan")) {
      return new Arctan(getExpTree(min+1, max));
    }

    if (max - min == 1 && charas.get(min).id.equals("pi")) {
      return new Float(PI);
    }
    if (max - min == 1 && charas.get(min).id.equals("ans")) {
      return new Float(ans);
    }


    //in case nothing else works
    error = true;
    return new Float(0.0);
    //return new Add(getExpTree(min, opIndex), getExpTree(opIndex+1, max));
  }
  void calcExpTree() {
    result.clear();
    ans = getExpTree().getValue();
    //double val = -0.0000000000000093249829;
    //println(val);
    String valString = String.valueOf(ans);
    if (valString.substring(valString.length()-2).equals(".0")) valString = valString.substring(0,valString.length()-2);
    //println(valString);

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
    if (error) {
      PImage img = loadImage("calcSprites/error.png");
      tint(255, 126);
      image(img, 203, 69);
      tint(255, 255);
      image(img, 201, 67);
    } else {
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
