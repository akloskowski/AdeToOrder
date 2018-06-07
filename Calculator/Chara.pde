class Chara {
  String id;
  void print( int x, int y) {
    //Prints sprite at coordinates.
    PImage img = loadImage("calcSprites/" + id + ".png");
    image(img, x, y);
  }
  Chara(String identification) {
    id = identification;
  }
}
