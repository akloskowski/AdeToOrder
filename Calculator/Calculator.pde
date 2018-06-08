CharaCollection charas;
ArrayList<Button> buttons;
boolean isShift;
final String[] CHARACTERS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "decimal", "inverse", "sin", "cos", "tan", "arcsin", "arccos", "arctan", "times", "divide", "+", "-", "(", ")", "degree", "exp", "ln", "log", "pi", "reciprocal", "square", "sqrt", "xroot"};
final String[] NUMCHARAS = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "decimal", "inverse"};
final String[] OPCHARAS = {"times", "divide", "+", "-"};
int timer;

void setup() {
  size (300, 400); //initialize size
  timer = second();

  //initialize character collection for LED screen
  charas = new CharaCollection(46, 42);
  //charas.charas.add(new Chara("0")); //debug example to test

  //initialize AL of all buttons to iterate through
  buttons = new ArrayList<Button>();

  buttons.add(new CharacterButton("0", 76, 348, 126, 377));
  buttons.add(new CharacterButton("decimal", 128, 348, 178, 377));
  buttons.add(new CharacterButton("inverse", 180, 348, 230, 377));

  buttons.add(new CharacterButton("1", 76, 310, 126, 339));
  buttons.add(new CharacterButton("2", 128, 310, 178, 339));
  buttons.add(new CharacterButton("3", 180, 310, 230, 339));

  buttons.add(new CharacterButton("4", 76, 272, 126, 301));
  buttons.add(new CharacterButton("5", 128, 272, 178, 301));
  buttons.add(new CharacterButton("6", 180, 272, 230, 301));

  buttons.add(new CharacterButton("7", 76, 234, 126, 263));
  buttons.add(new CharacterButton("8", 128, 234, 178, 263));
  buttons.add(new CharacterButton("9", 180, 234, 230, 263));

  buttons.add(new CharacterButton("ln", 76, 97, 126, 121));

  buttons.add(new CharacterButton("log", 23, 131, 73, 155));
  buttons.add(new CharacterButton("!", 76, 131, 126, 155));
  buttons.add(new CharacterButton("degree", 128, 131, 178, 155));

  buttons.add(new CharacterButton("pi", 23, 165, 73, 189));
  buttons.add(new CharacterButton("sin", "arcsin", 76, 165, 126, 189));
  buttons.add(new CharacterButton("cos", "arccos", 128, 165, 178, 189));
  buttons.add(new CharacterButton("tan", "arctan", 182, 165, 232, 189));

  buttons.add(new CharacterButton("exp", "xroot", 23, 199, 73, 223));
  buttons.add(new CharacterButton("reciprocal", 76, 199, 126, 223));
  buttons.add(new CharacterButton("(", 128, 199, 178, 223));
  buttons.add(new CharacterButton(")", 182, 199, 232, 223));

  buttons.add(new CharacterButton("square", "sqrt", 23, 234, 73, 257));

  buttons.add(new CharacterButton("divide", 235, 199, 285, 228));
  buttons.add(new CharacterButton("times", 235, 237, 285, 266));
  buttons.add(new CharacterButton("-", 235, 275, 285, 304));
  buttons.add(new CharacterButton("+", 235, 313, 285, 342));


  buttons.add(new ShiftButton());
  buttons.add(new ClearButton());
  buttons.add(new DelButton());
  buttons.add(new OnButton());
  buttons.add(new EqualsButton());

  buttons.add(new LeftButton());
  buttons.add(new RightButton());

  isShift = false;
}

void draw() {
  //println("Mouse: " + mouseX + ", " + mouseY);
  image(loadImage("calcSprites/bg.png"), 0, 0);
  charas.print();

  //prints buttons
  for (Button b : buttons) {
    if (b.isOver() && mousePressed) b.print();
  }

  //prints cursor
  if ((second() - timer) % 2 == 0) {
    PImage img = loadImage("calcSprites/cursor.png");
    if (charas.charas.size() < 16) {
      tint(255, 126);
      image(img, 48 + (16 + charas.cursor - charas.charas.size())*13, 44);
      tint(255, 255);
      image(img, 46 + (16 + charas.cursor - charas.charas.size())*13, 42);
    } else {
      tint(255, 126);
      image(img, 48 + charas.cursor*13, 44);
      tint(255, 255);
      image(img, 46 + charas.cursor*13, 42);
    }
  }

  //prints indicators
  if (charas.ledIndex > 0) {
    PImage img = loadImage("calcSprites/leftInd.png");
    tint(255, 126);
    image(img, 34, 44);
    tint(255, 255);
    image(img, 33, 42);
  }
  if (charas.ledIndex + charas.ledSize < charas.charas.size()) {
    PImage img = loadImage("calcSprites/rightInd.png");
    tint(255, 126);
    image(img, 258, 44);
    tint(255, 255);
    image(img, 256, 42);
  }
  if (isShift) {
    PImage img = loadImage("calcSprites/shift.png");
    tint(255, 126);
    image(img, 32, 31);
    tint(255, 255);
    image(img, 30, 29);
  }

  //prints labels
  image(loadImage("calcSprites/labels.png"), 0, 0);
}

void mouseClicked() {
  for (Button b : buttons) {
    if (b.isOver()) b.action();
  }
}

abstract class Button {
  int minX;
  int minY;
  int maxX;
  int maxY;
  //appearance: 0 is purple (default), 1 is for numbers, 2 is for operators, 3 is for left arrow and 4 is for right arrow
  int appearance = 0;
  void action() {
  };
  void print() { //prints pressed button
    PImage img = loadImage("calcSprites/pressed/" + appearance + ".png");
    image(img, minX, minY);
  };
  boolean isOver() {
    return (mouseX >= minX && mouseX <= maxX && mouseY >= minY && mouseY <= maxY);
  }
}

class CharacterButton extends Button {
  String id;
  String shiftID = null;
  CharacterButton(String identification, int AX, int AY, int BX, int BY) {
    id = identification;
    minX = AX;
    minY = AY;
    maxX = BX;
    maxY = BY;
    for ( String s : NUMCHARAS ) {
      if (id == s) appearance = 1;
    }
    for ( String s : OPCHARAS ) {
      if (id == s) appearance = 2;
    }
  }
  CharacterButton(String identification, String shiftIdentification, int AX, int AY, int BX, int BY) {
    shiftID = shiftIdentification;
    id = identification;
    minX = AX;
    minY = AY;
    maxX = BX;
    maxY = BY;
    for ( String s : NUMCHARAS ) {
      if (id == s) appearance = 1;
    }
    for ( String s : OPCHARAS ) {
      if (id == s) appearance = 2;
    }
  }
  void action() {
    String toID;
    if (isShift && shiftID != null) {
      toID = shiftID;
    } else {
      toID = id;
    }
    if (charas.cursor + charas.ledIndex >= charas.charas.size()) { //if at end
      charas.charas.add(new Chara(toID));
    } else {
      charas.charas.set(charas.cursor + charas.ledIndex, new Chara(toID));
    }
    charas.cursorRight();
    isShift = false; //undoes shift
  }
}

class LeftButton extends Button { // moves cursor left
  LeftButton() {
    minX = 187;
    minY = 105;
    maxX = 232;
    maxY = 150;
    appearance = 3;
  }
  void action() {
    timer = second();
    charas.cursorLeft();
  }
}

class RightButton extends Button { // moves cursor right
  RightButton() {
    minX = 235;
    minY = 105;
    maxX = 280;
    maxY = 150;
    appearance = 4;
  }
  void action() {
    timer = second();
    charas.cursorRight();
  }
}

class ShiftButton extends Button { //shifts
  ShiftButton() {
    minX = 23;
    minY = 97;
    maxX = 73;
    maxY = 121;
  }
  void action() {
    isShift = !isShift;
  }
}

class ClearButton extends Button { //clears character collection
  ClearButton() {
    minX = 235;
    minY = 165;
    maxX = minX + 50;
    maxY = minY + 24;
  }
  void action() {
    charas.charas = new ArrayList<Chara>();
    charas.result = new ArrayList<Chara>();
    charas.cursor = 0;
    charas.ledIndex = 0;
    charas.error = false;
  }
}
class DelButton extends Button { //deletes at cursor
  DelButton() {
    minX = 129;
    minY = 97;
    maxX = minX + 50;
    maxY = minY + 24;
  }
  void action() {
    if (charas.cursor + charas.ledIndex < charas.charas.size()) {
      charas.charas.remove(charas.cursor + charas.ledIndex);
      if (charas.charas.size() - charas.ledIndex < 16 && charas.ledIndex > 0) charas.ledIndex--;
    }
  }
}
class OnButton extends Button { //not really that useful; just a gag
  OnButton() {
    minX = 23;
    minY = 335;
    maxX = minX + 50;
    maxY = minY + 24;
  }
  void action() {
    if (isShift) {
      exit();
    }
  }
}

class EqualsButton extends Button {
  EqualsButton() {
    minX = 235;
    minY = 352;
    maxX = minX + 50;
    maxY = minY + 38;
    appearance = 2;
  }
  void action() {
    charas.error = false;
    charas.calcExpTree();
  }
}

//class ComboCharacterButton extends Button {
//  String[] ids;
//  String[] shiftIDs = null;
//  CharacterButton(String[] identifications, int AX, int AY, int BX, int BY) {
//    ids = identifications;
//    minX = AX;
//    minY = AY;
//    maxX = BX;
//    maxY = BY;
//    appearance = 1;
//  }
//  CharacterButton(String[] identifications, String[] shiftIdentifications, int AX, int AY, int BX, int BY) {
//    shiftIDs = shiftIdentifications;
//    ids = identifications;
//    minX = AX;
//    minY = AY;
//    maxX = BX;
//    maxY = BY;
//    appearance = 1;
//  }
//  void action() {
//    String toID;
//    if (isShift && shiftID != null) {
//      toID = shiftID;
//    } else {
//      toID = id;
//    }
//    if (charas.cursor + charas.ledIndex >= charas.charas.size()) { //if at end
//      charas.charas.add(new Chara(id));
//    } else {
//      charas.charas.set(charas.cursor + charas.ledIndex, new Chara(id));
//    }
//    charas.cursorRight();
//    isShift = false; //undoes shift
//  }
//}
